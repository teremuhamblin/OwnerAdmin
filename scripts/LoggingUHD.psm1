<#
    LoggingUHD.psm1
    Système de logs militaires LEGION-UHD
#>

function Write-UHDLog {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("INFO","WARNING","CRITICAL")]
        [string]$Level,

        [Parameter(Mandatory=$true)]
        [string]$Message
    )

    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    $logline   = "[LEGION-UHD][$timestamp][$Level] $Message"

    $logfile = Join-Path $PSScriptRoot "OwnerAdmin.log"

    Add-Content -Path $logfile -Value $logline

    switch ($Level) {
        "INFO"     { Write-Host $logline -ForegroundColor Green }
        "WARNING"  { Write-Host $logline -ForegroundColor Yellow }
        "CRITICAL" { Write-Host $logline -ForegroundColor Red }
    }
}

Export-ModuleMember -Function Write-UHDLog
