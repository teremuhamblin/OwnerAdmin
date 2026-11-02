###### Version avancée, technique, entièrement réécrite et optimisée du README.md OwnerAdmin v1.6, intégrant des thèmes complets, des cases à cocher, une présentation professionnelle GitHub, un style militaire/h4ch3r, et une structure beaucoup plus robuste.

# 🛡️ OwnerAdmin v1.6
>>Secure Ownership Control Tools for Windows — Safe + h4ch3r Mode

<p align="center">
Interface militaire • Sécurité NTFS avancée • Intégration contextuelle Windows • Scripts PowerShell renforcés  
</p>

---

### 📘 Présentation générale
*OwnerAdmin v1.6* est un *module avancé de gestion de propriété NTFS pour Windows*, permettant d’ajouter au menu contextuel *(clic droit)* deux actions critiques :
```text
- ✔️ Take Ownership (Safe + Hacker Mode)  
- ✔️ Restore TrustedInstaller (Hacker Mode)  
```

Ce projet vise les administrateurs, pentesters, power‑users, et passionnés de customisation système souhaitant disposer d’un contrôle précis, sécurisé et stylé de la propriété des fichiers/dossiers.

### 🗂️ Résumé intégré (version enrichie)
Ce projet inclut des entrées de registre pour Windows OS permettant d’ajouter une fonctionnalité de prise de possession de fichiers/dossiers via un simple clic droit.
```text
- ✔️ Installation : exécuter InstallTakeOwnership.reg  
- ✔️ Désinstallation : exécuter RemoveTakeOwnership.reg
```

> 📝 Crédits originaux :
- https://www.howtogeek.com/howto/windows-vista/add-take-ownership-to-explorer-right-click-menu-in-vista/
- **howtogeek.com in Bing**
   - *OwnerAdmin v1.6 est une version avancée, sécurisée, stylée, et entièrement réécrite pour usage professionnel*.

---

### ⚙️ Fonctionnalités principales
》》 🧩 **Gestion NTFS avancée**
```text
- ✔️ Prise de possession sécurisée (Take Ownership Safe)  
- ✔️ Restauration du propriétaire TrustedInstaller  
- ✔️ Confirmation obligatoire avant toute action  
- ✔️ Protection automatique des dossiers système critiques  
- ✔️ Mode Hacker (ASCII art + interface terminal militaire)  
- ✔️ Scripts PowerShell modulaires, robustes, audités  
- ✔️ Intégration complète via fichier .reg  
```

### 🧪 **Checklist de conformité**
- *v1.6*
- *Toutes les cases sont cochées car OwnerAdmin v1.6 est complet*

》》 🔐 ***Sécurité***
```text
- ☑️ Protection des répertoires critiques  
- ☑️ Vérification du chemin avant exécution  
- ☑️ Confirmation utilisateur obligatoire  
- ☑️ Mode sécurisé activé par défaut  
```

》》 🖥️ ***Interface & UX***
```text
- ☑️ Mode Hacker (ASCII art militaire)  
- ☑️ Messages stylés + feedback utilisateur  
- ☑️ Intégration contextuelle Windows (clic droit)  
- ☑️ Exécution silencieuse PowerShell (NoLogo / NoProfile)  
```

》》 🛠️ ***Scripts & Architecture***
```text
- ☑️ Script PowerShell centralisé (OwnershipTool.ps1)  
- ☑️ Paramètres modulaires : -Action, -Path, -HackerMode  
- ☑️ Structure de projet propre et documentée  
- ☑️ Compatibilité Windows 10 / 11 / Server  
```

### 📦 Packaging
- ☑️ Fichiers *.reg* prêts à l’emploi  
- ☑️ Documentation *.rst et .md* incluse  
- ☑️ *LICENSE* personnelle  
- ☑️ *VERSION.md* complet  

---

### 📂 Structure du projet

```text
OwnerAdmin/
├─ README.md
├─ LICENSE
├─ VERSION.md
├─ .editorconfig
├─ .gitignore
├─ .github/
│   ├─ workflows/
│   ├─ ISSUE_TEMPLATE.md
│   └─ PULLREQUESTTEMPLATE.md
│   └─ .gitkeep
├─ docs/
│   ├─ README.rst
│   ├─ overview.md
│   └─ .gitkeep
├─ reg/
│   ├─ README.rst
│   ├─ ContextMenu.reg
│   ├─ InstallTakeOwnership.reg
│   ├─ RemoveTakeOwnership.reg
│   └─ .gitkeep
└─ scripts/
│   ├─ README.rst
│   ├─ OwnershipTool.ps1
│   └─ .gitkeep
```

---

#### 🔧 1. ContextMenu.reg

Ce fichier ajoute deux entrées dans le menu contextuel Windows :

》》 🟩 **Take Ownership** (Safe • Hacker Mode)
```text
- Sécurité activée  
- Confirmation obligatoire  
- Mode Hacker (ASCII art militaire)  
- Fonctionne sur fichiers et dossiers  
```

》》 🟦 **Restore TrustedInstaller** (Hacker Mode)
```text
- Restaure le propriétaire d’origine  
- Confirmation obligatoire  
- Mode Hacker activé  
```

》》 📌 **Fonctionnement interne**
```text
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass ^
  -File "C:\Tools\OwnershipTool.ps1" ^
  -Action TakeOwnership ^
  -Path "%1" ^
  -HackerMode 1
```

---

#### 🧨 2. OwnershipTool.ps1
- — Le cœur du système

》》 🔐 **Sécurité intégrée**
- Le script bloque automatiquement les actions sur les dossiers critiques :
```text
C:\Windows\System32
C:\Windows\WinSxS
C:\Windows\Boot
C:\Program Files
C:\Program Files (x86)
```

》》 🛑 **Confirmation obligatoire**
- Avant toute action, l’utilisateur doit valider :
```text
CONFIRMER la prise de possession ? (y/n)
CONFIRMER la restauration TrustedInstaller ? (y/n)
```

》》》 🟩 **Action : TakeOwnership**
```text
takeown /f "<path>" /r /d y
icacls "<path>" /grant Administrators:F /t
```

》》》 🟦 **Action : RestoreTrustedInstaller**
```text
icacls "<path>" /setowner "NT SERVICE\TrustedInstaller" /t
```

》》》 💻 **Mode Hacker**
- ASCII art militaire  
- Interface terminal vert/noir  
- Effet “console Ghost Recon”  
- Messages stylés  

---

### 🧭 Roadmap OwnerAdmin v2.0 (Ghost Recon Edition)
```text
》》》 🔥 Fonctionnalités prévues
- ☐ Mode Stealth (logs invisibles)  
- ☐ Module de vérification SDDL  
- ☐ Interface graphique minimaliste (WPF)  
- ☐ Intégration LegionUHD (module Windows Ops)  
- ☐ Signature numérique du script PowerShell  
- ☐ Support multi‑langues (FR / EN / ES)  
```

---

### 👤 Auteur
- **The MadDoG.tmdg** 
- *Créateur du projet OwnerAdmin v1.6* 
- *Licence personnelle incluse dans le dépôt*.

---

### 📜 Licence
- 》》**Voir fichier LICENSE**.

---
