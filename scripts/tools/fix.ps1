Write-Host "[OwnerAdmin] Suppression des fichiers .lck et .lock..." -ForegroundColor Yellow

Get-ChildItem -Recurse -Include *.lck, *.lock -ErrorAction SilentlyContinue |
    Remove-Item -Force -ErrorAction SilentlyContinue

Write-Host "[OwnerAdmin] Nettoyage terminé." -ForegroundColor Green
