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
