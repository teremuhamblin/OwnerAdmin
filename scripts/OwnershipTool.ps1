param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("TakeOwnership", "RestoreTrustedInstaller", "CleanLocks")]
    [string]$Action,

    [Parameter(Mandatory=$false)]
    [string]$Path,

    [switch]$HackerMode
)

# ───────────────────────────────────────────────────────────────
# MODULES
# ───────────────────────────────────────────────────────────────
Import-Module "$PSScriptRoot\SystemSecurity.psm1"

# ───────────────────────────────────────────────────────────────
# HACKER BANNER
# ───────────────────────────────────────────────────────────────
function HackerBanner {
    Clear-Host
    Write-Host ""
    Write-Host " ███████╗██╗   ██╗██████╗  █████╗ ██████╗ " -ForegroundColor Green
    Write-Host " ██╔════╝██║   ██║██╔══██╗██╔══██╗██╔══██╗" -ForegroundColor Green
    Write-Host " ███████╗██║   ██║██████╔╝███████║██████╔╝" -ForegroundColor Green
    Write-Host " ╚════██║██║   ██║██╔══██╗██╔══██║██╔══██╗" -ForegroundColor Green
    Write-Host " ███████║╚██████╔╝██║  ██║██║  ██║██║  ██║" -ForegroundColor Green
    Write-Host " ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝" -ForegroundColor Green
    Write-Host ""
    Write-Host "        LEGION-UHD • Ownership Control Module" -ForegroundColor DarkGreen
    Write-Host "        -------------------------------------" -ForegroundColor DarkGreen
    Write-Host ""
}

if ($HackerMode) { HackerBanner }

# ───────────────────────────────────────────────────────────────
# LOGGING HELPERS
# ───────────────────────────────────────────────────────────────
function Info($msg)  { Write-Host "[INFO] $msg" -ForegroundColor Cyan }
function Warn($msg)  { Write-Host "[WARN] $msg" -ForegroundColor Yellow }
function Err($msg)   { Write-Host "[ERROR] $msg" -ForegroundColor Red }
function Ok($msg)    { Write-Host "[OK] $msg" -ForegroundColor Green }

# ───────────────────────────────────────────────────────────────
# MODE CLEANLOCKS — Nettoyage des fichiers .lck / .lock
# ───────────────────────────────────────────────────────────────
if ($Action -eq "CleanLocks") {

    Info "Nettoyage des fichiers .lck et .lock..."

    $bat = Join-Path $PSScriptRoot "tools\fix.bat"
    $ps1 = Join-Path $PSScriptRoot "tools\fix.ps1"

    if (Test-Path $bat) {
        & $bat
    }

    if (Test-Path $ps1) {
        & $ps1
    }

    Ok "Nettoyage terminé."
    exit 0
}

# ───────────────────────────────────────────────────────────────
# SYSTEM SECURITY SCAN (Ghost Recon Mode)
# ───────────────────────────────────────────────────────────────
if ($HackerMode) {
    Write-Host ">>> Analyse Système • LEGION-UHD <<<" -ForegroundColor DarkGreen

    $tpm = Get-TPMStatus
    $bde = Get-BitLockerStatus
    $sb  = Get-SecureBootStatus
    $os  = Get-OSInfo

    Write-Host "TPM Enabled      : $($tpm.IsEnabled)" -ForegroundColor Green
    Write-Host "TPM Activated    : $($tpm.IsActivated)" -ForegroundColor Green
    Write-Host "TPM Owned        : $($tpm.IsOwned)" -ForegroundColor Green
    Write-Host "BitLocker        : $bde" -ForegroundColor Cyan
    Write-Host "SecureBoot       : $sb" -ForegroundColor Cyan
    Write-Host "OS               : $($os.Caption) ($($os.Version))" -ForegroundColor Yellow
    Write-Host ""
}

# ───────────────────────────────────────────────────────────────
# PROTECTION DES ZONES CRITIQUES
# ───────────────────────────────────────────────────────────────
$systemPaths = @(
    "$env:WINDIR\System32",
    "$env:WINDIR\WinSxS",
    "$env:WINDIR\Boot",
    "$env:ProgramFiles",
    "$env:ProgramFiles(x86)"
)

$fullPath = [System.IO.Path]::GetFullPath($Path)

foreach ($sp in $systemPaths) {
    if ($fullPath.StartsWith($sp, [System.StringComparison]::InvariantCultureIgnoreCase)) {
        Err "Zone critique détectée : $fullPath"
        Err "Action bloquée pour éviter une corruption système."
        exit 1
    }
}

# ───────────────────────────────────────────────────────────────
# CONFIRMATION
# ───────────────────────────────────────────────────────────────
Info "Cible : $fullPath"
Info "Action : $Action"

$question = switch ($Action) {
    "TakeOwnership"          { "CONFIRMER la prise de possession ? (y/n)" }
    "RestoreTrustedInstaller" { "CONFIRMER la restauration TrustedInstaller ? (y/n)" }
}

$answer = Read-Host $question

if ($answer -notin @("y","Y")) {
    Warn "Action annulée."
    exit 0
}

# ───────────────────────────────────────────────────────────────
# ACTIONS PRINCIPALES
# ───────────────────────────────────────────────────────────────
switch ($Action) {

    "TakeOwnership" {
        Info "Prise de possession..."
        & takeown /f "$fullPath" /r /d y | Out-Null

        Info "Application des droits Administrators:F..."
        & icacls "$fullPath" /grant Administrators:F /t | Out-Null

        Ok "Propriété prise + droits Administrators appliqués."
    }

    "RestoreTrustedInstaller" {
        $trusted = "NT SERVICE\TrustedInstaller"

        Info "Restauration du propriétaire TrustedInstaller..."
        & icacls "$fullPath" /setowner "$trusted" /t | Out-Null

        Ok "Propriétaire restauré à TrustedInstaller."
    }
}

# ───────────────────────────────────────────────────────────────
# FIN — MODE HACKER
# ───────────────────────────────────────────────────────────────
if ($HackerMode) {
    Write-Host ""
    Write-Host ">>> OPÉRATION TERMINÉE • LEGION-UHD MODULE <<<" -ForegroundColor DarkGreen
    Write-Host ""
}
