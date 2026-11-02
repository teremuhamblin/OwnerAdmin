<#
    Protection.psm1
    Protection des chemins sensibles OwnerAdmin v1.6
#>

$ProtectedPaths = @(
    "C:\Windows",
    "C:\Windows\System32",
    "C:\Windows\WinSxS",
    "C:\Program Files",
    "C:\Program Files (x86)"
)

function Test-ProtectedPath {
    param([string]$Path)

    foreach ($p in $ProtectedPaths) {
        if ($Path -like "$p*") {
            return $true
        }
    }
    return $false
}

function Assert-PathSafety {
    param([string]$Path)

    if (Test-ProtectedPath -Path $Path) {
        throw "Chemin protégé — opération interdite."
    }
}

Export-ModuleMember -Function Test-ProtectedPath, Assert-PathSafety
