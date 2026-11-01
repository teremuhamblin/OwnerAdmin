# 📘 OwnerAdmin
- 》》 v1.6

### 🛡️ Secure Ownership
- 》》 Control Tools for Windows
- 》》Safe + h4ch3r Mode

**OwnerAdmin v1.6** est *un ensemble d’outils avancés* permettant *de gérer
la propriété et les permissions NTFS sous Windows*, directement depuis
le  " `menu contextuel` " *clic droit*  
Il inclut :
```text
- ✔️ Prise de possession sécurisée (Take Ownership Safe)
- ✔️ Restauration du propriétaire TrustedInstaller
- ✔️ Confirmation obligatoire avant toute action
- ✔️ Protection contre les dossiers système critiques
- ✔️ Mode Hacker (ASCII art, interface terminal stylée)
- ✔️ Scripts PowerShell robustes et modulaires
- ✔️ Intégration complète via fichier .reg
```

<p align="center">
Ce projet est conçu pour les utilisateurs avancés, administrateurs,
pentesters, et passionnés de personnalisation système.
</p>

### 📂 Structure du projet
- *Initiale*
```text
OwnerAdmin/
├─ README.md
├─ LICENSE
├─ VERSION.md
├─ .gitignore
├─ .github/
│   ├─ ISSUE_TEMPLATE.md
│   └─ PULLREQUESTTEMPLATE.md
├─ docs/
│   └─ overview.rst
├─ reg/
│   └─ ContextMenu.reg
└─ scripts/
    └─ OwnershipTool.ps1
```

### 🔧 1. ** ContextMenu.reg **
> *Ce fichier ajoute deux entrées dans le menu contextuel Windows*
``` text
🟩 Take Ownership (Safe • Hacker Mode)
- Appelle le script PowerShell avec :
  - Sécurité activée
  - Confirmation
  - Mode Hacker (ASCII art)
  - Fonctionne sur fichiers et dossiers
```

```text
🟦 Restore TrustedInstaller (Hacker Mode)
- Restaure le propriétaire original TrustedInstaller
- Confirmation obligatoire
- Mode Hacker activé
```

```text
>📌 Fonctionnement
- *Le fichier .reg appelle PowerShell*

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "C:\Tools\OwnershipTool.ps1" -Action TakeOwnership -Path "%1" -HackerMode 1
```

---

### 🧨 2. OwnershipTool.ps1
- Le cœur du projet : *un script PowerShell complet, sécurisé, stylé*.
```text
🔐 Sécurité intégrée
Le script bloque automatiquement les actions sur les dossiers critiques :

- C:\Windows\System32
- C:\Windows\WinSxS
- C:\Windows\Boot
- C:\Program Files
- C:\Program Files (x86)
```
