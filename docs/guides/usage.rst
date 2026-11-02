===========================
Guide d'utilisation
===========================

Menu contextuel
---------------
- **Take Ownership** — Prend la propriété NTFS
- **Restore TrustedInstaller** — Restaure la propriété système

Exécution directe PowerShell
----------------------------
``powershell.exe -File OwnershipTool.ps1 -Path "C:\test.txt" -Take``  
``powershell.exe -File OwnershipTool.ps1 -Path "C:\test.txt" -Restore``

Mode Hacker
-----------
``powershell.exe -File OwnershipTool.ps1 -HackerMode``

Affiche un tableau tactique :
- TPM ✔ / ✘
- BitLocker ✔ / ✘
- SecureBoot ✔ / ✘
- Version OS
