param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("TakeOwnership", "RestoreTrustedInstaller")]
    [string]$Action,

    [Parameter(Mandatory=$true)]
    [string]$Path,

    [switch]$HackerMode
)

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

function Info($msg)  { Write-Host "[INFO] $msg" -ForegroundColor Cyan }
function Warn($msg)  { Write-Host "[WARN] $msg" -ForegroundColor Yellow }
function Err($msg)   { Write-Host "[ERROR] $msg" -ForegroundColor Red }
function Ok($msg)    { Write-Host "[OK] $msg" -ForegroundColor Green }

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

Info "Cible : $fullPath"
Info "Action : $Action"

$question = switch ($Action) {
    "TakeOwnership" { "CONFIRMER la prise de possession ? (y/n)" }
    "RestoreTrustedInstaller" { "CONFIRMER la restauration TrustedInstaller ? (y/n)" }
}

$answer = Read-Host $question

if ($answer -notin @("y","Y")) {
    Warn "Action annulée."
    exit 0
}

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

if ($HackerMode) {
    Write-Host ""
    Write-Host ">>> OPÉRATION TERMINÉE • LEGION-UHD MODULE <<<" -ForegroundColor DarkGreen
    Write-Host ""
}
