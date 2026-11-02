<#
    NativeACL.psm1
    Wrapper pour OwnerAdminACL.exe — moteur C++ ACL natif
#>

function Invoke-NativeACL {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path,

        [Parameter(Mandatory=$true)]
        [ValidateSet("TakeOwnership","RestoreTrustedInstaller","FullControl","ReadOnly")]
        [string]$Mode
    )

    try {
        $exe = Join-Path $PSScriptRoot "OwnerAdminACL.exe"

        if (-not (Test-Path $exe)) {
            throw "OwnerAdminACL.exe introuvable."
        }

        $cmd = "& `"$exe`" --path `"$Path`" --mode $Mode"
        $output = Invoke-Expression $cmd

        return [PSCustomObject]@{
            Path   = $Path
            Mode   = $Mode
            Output = $output
        }
    }
    catch {
        return [PSCustomObject]@{
            Path   = $Path
            Mode   = $Mode
            Output = "Erreur NativeACL"
        }
    }
}

Export-ModuleMember -Function Invoke-NativeACL
