function Get-TPMStatus {
    try {
        $tpm = Get-WmiObject -Namespace "root\cimv2\security\MicrosoftTpm" -Class Win32_Tpm -ErrorAction Stop
        return [PSCustomObject]@{
            IsEnabled   = $tpm.IsEnabled().IsEnabled
            IsActivated = $tpm.IsActivated().IsActivated
            IsOwned     = $tpm.IsOwned().IsOwned
        }
    } catch {
        return $null
    }
}

function Get-BitLockerStatus {
    try {
        $vol = Get-WmiObject -Namespace "root\cimv2\security\MicrosoftVolumeEncryption" -Class Win32_EncryptableVolume
        $status = $vol.GetProtectionStatus().ProtectionStatus

        return switch ($status) {
            0 { "Non protégé" }
            1 { "Protégé" }
            2 { "Protection en cours" }
            default { "Inconnu" }
        }
    } catch {
        return "Indisponible"
    }
}

function Get-SecureBootStatus {
    try {
        $sb = Confirm-SecureBootUEFI
        return $sb
    } catch {
        return $false
    }
}

function Get-OSInfo {
    $os = Get-WmiObject Win32_OperatingSystem
    return [PSCustomObject]@{
        Caption = $os.Caption
        Version = $os.Version
        Build   = $os.BuildNumber
    }
}
