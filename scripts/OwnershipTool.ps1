param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("TakeOwnership", "RestoreTrustedInstaller", "CleanLocks", "NativeACL")]
    [string]$Action,

    [Parameter(Mandatory=$false)]
    [string]$Path,

    [switch]$HackerMode
)

# ============================================================
#   MODULES
# ============================================================
Import-Module "$PSScriptRoot\scripts\SystemSecurity.psm1"
Import-Module "$PSScriptRoot\scripts\ReconSecurity.psm1"
Import-Module "$PSScriptRoot\scripts\OwnershipCore.psm1"
Import-Module "$PSScriptRoot\scripts\Protection.psm1"
Import-Module "$PSScriptRoot\scripts\LoggingUHD.psm1"
Import-Module "$PSScriptRoot\scripts\NativeACL.psm1"

# ============================================================
#   BANNIÈRE HACKER
# ============================================================
function Show-Banner {
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

if ($HackerMode) { Show-Banner }

# ============================================================
#   LOGGING HELPERS
# ============================================================
function Info($msg)  { Write-UHDLog -Level INFO     -Message $msg }
function Warn($msg)  { Write-UHDLog -Level WARNING  -Message $msg }
function Err($msg)   { Write-UHDLog -Level CRITICAL -Message $msg }
function Ok($msg)    { Write-UHDLog -Level INFO     -Message $msg }

# ============================================================
#   MODE CLEANLOCKS
# ============================================================
if ($Action -eq "CleanLocks") {
    Info "Nettoyage des fichiers .lck / .lock..."
    $result = Invoke-CleanLocks -Path $Path
    Ok "Nettoyage terminé. Fichiers supprimés : $($result.Count)"
    exit 0
}

# ============================================================
#   MODE HACKER — HUD COMPLET
# ============================================================
if ($HackerMode) {
    Show-HackerMode

    Write-Host ""
    Write-Host ">>> ADVANCED SECURITY RECON" -ForegroundColor Yellow
    Write-Host "------------------------------------------------------------" -ForegroundColor DarkYellow

    $recon = Invoke-SystemRecon

    Write-Host (" Boot Mode       : {0}" -f $recon.BootMode)
    Write-Host (" Hyper-V         : {0}" -f $recon.HyperV)
    Write-Host (" VBS             : {0}" -f $recon.VBS)
    Write-Host (" HVCI            : {0}" -f $recon.HVCI)
    Write-Host (" CredentialGuard : {0}" -f $recon.CredentialGuard)
    Write-Host (" Core Isolation  : {0}" -f $recon.CoreIsolation)
    Write-Host (" Secure Kernel   : {0}" -f $recon.SecureKernel)

    Write-Host ""
}

# ============================================================
#   PROTECTION DES ZONES CRITIQUES
# ============================================================
try {
    Assert-PathSafety -Path $Path
}
catch {
    Err "Zone critique détectée : $Path"
    Err "Action bloquée pour éviter une corruption système."
    exit 1
}

# ============================================================
#   CONFIRMATION UTILISATEUR
# ============================================================
$fullPath = [System.IO.Path]::GetFullPath($Path)

Info "Cible : $fullPath"
Info "Action : $Action"

$question = switch ($Action) {
    "TakeOwnership"           { "CONFIRMER la prise de possession ? (y/n)" }
    "RestoreTrustedInstaller" { "CONFIRMER la restauration TrustedInstaller ? (y/n)" }
    "NativeACL"               { "CONFIRMER l'utilisation du moteur ACL natif ? (y/n)" }
}

$answer = Read-Host $question

if ($answer -notin @("y","Y")) {
    Warn "Action annulée."
    exit 0
}

# ============================================================
#   ACTIONS PRINCIPALES
# ============================================================
switch ($Action) {

    "TakeOwnership" {
        Info "Prise de possession..."
        $result = Invoke-TakeOwnership -Path $fullPath
        Ok "Propriété prise."
    }

    "RestoreTrustedInstaller" {
        Info "Restauration TrustedInstaller..."
        $result = Invoke-RestoreTrustedInstaller -Path $fullPath
        Ok "Propriétaire restauré."
    }

    "NativeACL" {
        Info "Moteur ACL natif OwnerAdminACL.exe..."
        $result = Invoke-NativeACL -Path $fullPath -Mode "FullControl"
        Ok "NativeACL exécuté."
    }
}

# ============================================================
#   FIN — MODE HACKER
# ============================================================
if ($HackerMode) {
    Write-Host ""
    Write-Host ">>> OPÉRATION TERMINÉE • LEGION-UHD MODULE <<<" -ForegroundColor DarkGreen
    Write-Host ""
}
