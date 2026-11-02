#include <windows.h>
#include <stdio.h>
#include <accctrl.h>
#include <aclapi.h>

DWORD AddAceToObjectsSecurityDescriptor(
    LPTSTR pszObjName,          // chemin de l'objet (fichier)
    SE_OBJECT_TYPE ObjectType,  // type d'objet
    LPTSTR pszTrustee,          // utilisateur / groupe
    TRUSTEE_FORM TrusteeForm,   // format du trustee
    DWORD dwAccessRights,       // droits d'accès
    ACCESS_MODE AccessMode,     // type d'ACE
    DWORD dwInheritance         // héritage
)
{
    DWORD dwRes = 0;
    PACL pOldDACL = NULL, pNewDACL = NULL;
    PSECURITY_DESCRIPTOR pSD = NULL;
    EXPLICIT_ACCESS ea;

    if (NULL == pszObjName || NULL == pszTrustee)
        return ERROR_INVALID_PARAMETER;

    // Récupère la DACL existante
    dwRes = GetNamedSecurityInfo(
        pszObjName,
        ObjectType,
        DACL_SECURITY_INFORMATION,
        NULL,
        NULL,
        &pOldDACL,
        NULL,
        &pSD
    );
    if (ERROR_SUCCESS != dwRes) {
        printf("GetNamedSecurityInfo Error %u\n", dwRes);
        goto Cleanup;
    }

    // Prépare la nouvelle ACE
    ZeroMemory(&ea, sizeof(EXPLICIT_ACCESS));
    ea.grfAccessPermissions = dwAccessRights;
    ea.grfAccessMode = AccessMode;
    ea.grfInheritance = dwInheritance;
    ea.Trustee.TrusteeForm = TrusteeForm;
    ea.Trustee.ptstrName = pszTrustee;

    // Crée une nouvelle DACL avec l'ACE ajoutée
    dwRes = SetEntriesInAcl(1, &ea, pOldDACL, &pNewDACL);
    if (ERROR_SUCCESS != dwRes) {
        printf("SetEntriesInAcl Error %u\n", dwRes);
        goto Cleanup;
    }

    // Applique la nouvelle DACL
    dwRes = SetNamedSecurityInfo(
        pszObjName,
        ObjectType,
        DACL_SECURITY_INFORMATION,
        NULL,
        NULL,
        pNewDACL,
        NULL
    );
    if (ERROR_SUCCESS != dwRes) {
        printf("SetNamedSecurityInfo Error %u\n", dwRes);
        goto Cleanup;
    }

Cleanup:
    if (pSD != NULL)
        LocalFree((HLOCAL)pSD);
    if (pNewDACL != NULL)
        LocalFree((HLOCAL)pNewDACL);

    return dwRes;
}

BOOL EnablePrivilege(LPCSTR privName)
{
    HANDLE hToken;
    TOKEN_PRIVILEGES tp;
    LUID luid;

    if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken)) {
        printf("OpenProcessToken error: %u\n", GetLastError());
        return FALSE;
    }

    if (!LookupPrivilegeValue(NULL, privName, &luid)) {
        printf("LookupPrivilegeValue error: %u\n", GetLastError());
        CloseHandle(hToken);
        return FALSE;
    }

    tp.PrivilegeCount = 1;
    tp.Privileges[0].Luid = luid;
    tp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;

    if (!AdjustTokenPrivileges(hToken, FALSE, &tp, 0, NULL, NULL)) {
        printf("AdjustTokenPrivileges error: %u\n", GetLastError());
        CloseHandle(hToken);
        return FALSE;
    }

    CloseHandle(hToken);
    return TRUE;
}

int main(int argc, char* argv[])
{
    if (argc < 3) {
        printf("Usage: OwnerAdminACL.exe <full_path> <username_or_group>\n");
        printf("Exemple: OwnerAdminACL.exe \"C:\\\\test.txt\" \"Administrators\"\n");
        return 1;
    }

    char* path = argv[1];
    char* user = argv[2];

    printf("[+] OwnerAdminACL — Native ACL Engine\n");

    if (!EnablePrivilege("SeTakeOwnershipPrivilege")) {
        printf("[-] Impossible d'activer SeTakeOwnershipPrivilege\n");
        return 1;
    } else {
        printf("[+] SeTakeOwnershipPrivilege activé\n");
    }

    DWORD dwRes = AddAceToObjectsSecurityDescriptor(
        path,
        SE_FILE_OBJECT,
        user,
        TRUSTEE_IS_NAME,
        GENERIC_READ | GENERIC_WRITE,
        GRANT_ACCESS,
        0
    );

    if (ERROR_SUCCESS != dwRes) {
        printf("[-] AddAceToObjectsSecurityDescriptor Error %u\n", dwRes);
        return 1;
    } else {
        printf("[+] ACL modifiée pour %s sur %s\n", user, path);
    }

    return 0;
}
