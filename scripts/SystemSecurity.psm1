<#
    SystemSecurity.psm1
    Module de sécurité pour OwnerAdmin v1.6 — LEGION-UHD
    Fournit : TPM, BitLocker, SecureBoot, OSInfo, HUD HackerMode
#>

# ============================================================
#   MODULE — FONCTIONS SYSTÈME
# ============================================================

function Get-TPMStatus {
    try {
        $tpm = Get-WmiObject -Namespace "root\cimv2\security\MicrosoftTpm" -Class Win32_Tpm -ErrorAction Stop

        return [PSCustomObject]@{
            IsEnabled      = $tpm.IsEnabled().IsEnabled
            IsActivated    = $tpm.IsActivated().IsActivated
            IsOwned        = $tpm.IsOwned().IsOwned
            ManufacturerID = $tpm.ManufacturerId
            SpecVersion    = ($tpm.SpecVersion | Out-String).Trim()
        }
    } catch {
        return [PSCustomObject]@{
            IsEnabled      = $false
            IsActivated    = $false
            IsOwned        = $false
            ManufacturerID = "N/A"
            SpecVersion    = "N/A"
        }
    }
}

function Get-BitLockerStatus {
    try {
        $volumes = Get-WmiObject -Namespace "root\cimv2\security\MicrosoftVolumeEncryption" -Class Win32_EncryptableVolume

        $results = foreach ($vol in $volumes) {
            $status = $vol.GetProtectionStatus().ProtectionStatus

            $state = switch ($status) {
                0 { "Non protégé" }
                1 { "Protégé" }
                2 { "Protection en cours" }
                default { "Inconnu" }
            }

            [PSCustomObject]@{
                DriveLetter = $vol.DriveLetter
                Status      = $state
            }
        }

        return $results
    } catch {
        return [PSCustomObject]@{
            DriveLetter = "N/A"
            Status      = "Indisponible"
        }
    }
}

function Get-SecureBootStatus {
    try {
        $sb = Confirm-SecureBootUEFI
        return [PSCustomObject]@{
            SecureBoot = $sb
        }
    } catch {
        return [PSCustomObject]@{
            SecureBoot = $false
        }
    }
}

function Get-OSInfo {
    try {
        $os = Get-WmiObject Win32_OperatingSystem

        return [PSCustomObject]@{
            Caption = $os.Caption
            Version = $os.Version
            Build   = $os.BuildNumber
            Arch    = (Get-CimInstance Win32_Processor).AddressWidth
        }
    } catch {
        return [PSCustomObject]@{
            Caption = "Indisponible"
            Version = "N/A"
            Build   = "N/A"
            Arch    = "N/A"
        }
    }
}

# ============================================================
#   MODULE — HUD HACKERMODE
# ============================================================

function Show-HackerMode {
    Clear-Host

    Write-Host "============================================================" -ForegroundColor DarkGreen
    Write-Host "        OWNERADMIN v1.6 — LEGION-UHD SYSTEM RECON" -ForegroundColor Green
    Write-Host "============================================================" -ForegroundColor DarkGreen
    Write-Host ""
    Write-Host " [BOOT SEQUENCE] Initialisation du HUD tactique..." -ForegroundColor Cyan
    Start-Sleep -Milliseconds 400

    # === Récupération des données système ===
    $tpm        = Get-TPMStatus
    $bitlocker  = Get-BitLockerStatus
    $secureboot = Get-SecureBootStatus
    $osinfo     = Get-OSInfo

    Write-Host ""
    Write-Host ">>> SYSTEM OVERVIEW" -ForegroundColor Yellow
    Write-Host "------------------------------------------------------------" -ForegroundColor DarkYellow

    Write-Host (" OS              : {0}" -f $osinfo.Caption)
    Write-Host (" Version         : {0}" -f $osinfo.Version)
    Write-Host (" Build           : {0}" -f $osinfo.Build)
    Write-Host (" Architecture    : {0}-bit" -f $osinfo.Arch)

    Write-Host ""
    Write-Host ">>> SECURITY MODULES" -ForegroundColor Yellow
    Write-Host "------------------------------------------------------------" -ForegroundColor DarkYellow

    Write-Host (" TPM Enabled     : {0}" -f $tpm.IsEnabled)
    Write-Host (" TPM Activated   : {0}" -f $tpm.IsActivated)
    Write-Host (" TPM Owned       : {0}" -f $tpm.IsOwned)
    Write-Host (" TPM Vendor      : {0}" -f $tpm.ManufacturerID)
    Write-Host (" TPM Spec        : {0}" -f $tpm.SpecVersion)

    Write-Host ""
    Write-Host (" SecureBoot      : {0}" -f $secureboot.SecureBoot)

    Write-Host ""
    Write-Host ">>> BITLOCKER STATUS" -ForegroundColor Yellow
    Write-Host "------------------------------------------------------------" -ForegroundColor DarkYellow

    foreach ($vol in $bitlocker) {
        Write-Host (" Volume {0}      : {1}" -f $vol.DriveLetter, $vol.Status)
    }

    Write-Host ""
    Write-Host "============================================================" -ForegroundColor DarkGreen
    Write-Host "   SYSTEM READY — MODE OPÉRATEUR ACTIF — OWNERADMIN v1.6" -ForegroundColor Green
    Write-Host "============================================================" -ForegroundColor DarkGreen
    Write-Host ""
}

# ============================================================
#   EXPORT DES FONCTIONS
# ============================================================

Export-ModuleMember -Function Get-TPMStatus, Get-BitLockerStatus, Get-SecureBootStatus, Get-OSInfo, Show-HackerMode
