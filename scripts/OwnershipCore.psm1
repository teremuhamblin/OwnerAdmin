<#
    OwnershipCore.psm1
    Module principal OwnerAdmin v1.6
#>

function Invoke-TakeOwnership {
    param([string]$Path)

    try {
        if (-not (Test-Path $Path)) {
            throw "Chemin introuvable."
        }

        takeown /F "$Path" /A /R /D Y | Out-Null
        icacls "$Path" /grant Administrators:F /T | Out-Null

        return [PSCustomObject]@{
            Path   = $Path
            Action = "TakeOwnership"
            Status = "Succès"
        }
    }
    catch {
        return [PSCustomObject]@{
            Path   = $Path
            Action = "TakeOwnership"
            Status = "Erreur"
        }
    }
}

function Invoke-RestoreTrustedInstaller {
    param([string]$Path)

    try {
        if (-not (Test-Path $Path)) {
            throw "Chemin introuvable."
        }

        icacls "$Path" /setowner "NT SERVICE\TrustedInstaller" /T | Out-Null

        return [PSCustomObject]@{
            Path   = $Path
            Action = "RestoreTrustedInstaller"
            Status = "Succès"
        }
    }
    catch {
        return [PSCustomObject]@{
            Path   = $Path
            Action = "RestoreTrustedInstaller"
            Status = "Erreur"
        }
    }
}

function Invoke-CleanLocks {
    param([string]$Path)

    try {
        $files = Get-ChildItem -Path $Path -Recurse -Include *.lck, *.lock -ErrorAction SilentlyContinue

        foreach ($f in $files) {
            Remove-Item $f.FullName -Force -ErrorAction SilentlyContinue
        }

        return [PSCustomObject]@{
            Path   = $Path
            Action = "CleanLocks"
            Status = "Succès"
            Count  = $files.Count
        }
    }
    catch {
        return [PSCustomObject]@{
            Path   = $Path
            Action = "CleanLocks"
            Status = "Erreur"
        }
    }
}

Export-ModuleMember -Function Invoke-TakeOwnership, Invoke-RestoreTrustedInstaller, Invoke-CleanLocks
