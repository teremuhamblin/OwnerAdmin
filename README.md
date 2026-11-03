###### Version v2.0 du README.md, entièrement réécrite, modernisée, militarisée, alignée avec toutes les évolutions récentes de ton projet OwnerAdmin (modules .psm1, HUD, ReconSecurity, NativeACL, LoggingUHD, Protection, architecture complète).

# 🛡️ OwnerAdmin 🛡️
- **v2.0** — *Ghost Recon Edition*

<p align="left">
NTFS Ownership Control Suite for Windows + Military‑Grade + H4ch3r Mode
</p>
<p align="right">
Interface militaire • Recon système avancé • Moteur ACL natif • Protection Windows renforcée  
</p>

---
---

### 📘 Présentation générale
OwnerAdmin v2.0 est une suite avancée de contrôle NTFS pour Windows, conçue pour les :
```text
- Administrateurs système 
- Pentesters  
- Power‑users  
- Architectes Windows Ops  
- Passionnés de customisation système Ghost Recon / LEGION‑UHD  
```

*OwnerAdmin v1.6* est un *module avancé de gestion de propriété NTFS pour Windows*, permettant d’ajouter au menu contextuel *(clic droit)* deux actions critiques :
- ✔️ Take Ownership (Safe + Hacker Mode)  
- ✔️ Restore TrustedInstaller (Hacker Mode)

#### 》》 *Cette version apporte une refonte complète du projet v1.6* :
```text
- Architecture modulaire (.psm1)  
- Reconnaissance système avancée (VBS, HVCI, DeviceGuard, SecureKernel)  
- Moteur ACL natif (C++ Engine)  
- Protection renforcée des chemins sensibles  
- HUD militaire complet  
- Logs tactiques LEGION‑UHD  
- Mode Hacker amélioré  
- Mode CleanLocks intégré  
- Intégration contextuelle Windows via .reg  
```

---
---

### ⚙️ Fonctionnalités principales v2.0
- 》》 **🧩 Gestion NTFS avancée**
```text
- ✔️ Take Ownership (Safe + Hacker Mode)
- ✔️ Restore TrustedInstaller
- ✔️ NativeACL Engine (FullControl / ReadOnly / Restore)
- ✔️ CleanLocks (suppression .lck / .lock)
```

- 》》 🔐 **Sécurité renforcée**
```text
- ✔️ Protection automatique des répertoires critiques
- ✔️ Vérification du chemin avant exécution
- ✔️ Confirmation obligatoire
- ✔️ Logs militaires LEGION‑UHD
- ✔️ Mode Stealth (prévu)
```
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

#### 》》 🛰️ **Reconnaissance système Ghost Recon**
```text
- ✔️ TPM Status
- ✔️ BitLocker Status
- ✔️ SecureBoot Status
- ✔️ OSInfo (Version, Build, Arch)
- ✔️ VBS (Virtualization Based Security)
- ✔️ HVCI (Hypervisor Code Integrity)
- ✔️ DeviceGuard
- ✔️ CredentialGuard
- ✔️ Core Isolation
- ✔️ SecureKernel
- ✔️ Hyper-V Status
- ✔️ Boot Mode (UEFI / Legacy)
```

#### 》》 🖥️ **Interface & UX**
```text
- ✔️ HUD HackerMode (ASCII militaire)
- ✔️ Console Ghost Recon (vert/noir)
- ✔️ Messages stylés + feedback utilisateur
- ✔️ Exécution silencieuse PowerShell (NoLogo / NoProfile)
```

#### 》》 🛠️ **Architecture modulaire**
```text
- ✔️ SystemSecurity.psm1
- ✔️ ReconSecurity.psm1
- ✔️ OwnershipCore.psm1
- ✔️ Protection.psm1
- ✔️ LoggingUHD.psm1
- ✔️ NativeACL.psm1
```

---

#### 》》 📦 **Packaging v2.0**
```text
- ✔️ Fichiers .reg prêts à l’emploi
- ✔️ Scripts PowerShell modulaires
- ✔️ Documentation .md et .rst
- ✔️ LICENSE personnelle
- ✔️ VERSION.md complet
```

---
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

### 📂 Structure du projet v2.0

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
│   ├─ PULL_REQUEST_TEMPLATE.md
│   └─ CODEOWNERS
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
    ├─ OwnershipTool.ps1
    ├─ SystemSecurity.psm1
    ├─ ReconSecurity.psm1
    ├─ OwnershipCore.psm1
    ├─ Protection.psm1
    ├─ LoggingUHD.psm1
    ├─ NativeACL.psm1
    └─ .gitkeep
```

---

#### 🔧 1. ContextMenu.reg — Intégration Windows

- 》》 🟩 **Take Ownership** (*Safe + Hacker Mode*)
```text
- Sécurité activée
- Confirmation obligatoire
- Mode Hacker (ASCII militaire)
- Fonctionne sur fichiers et dossiers
```

- 》》 🟦 **Restore TrustedInstaller**
```text
- Restaure le propriétaire d’origine
- Confirmation obligatoire
- Mode Hacker activé
```

- 》》 📌 **Fonctionnement interne**
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

#### 🧨 2. OwnershipTool.ps1 — Le cœur du système

- 》》 🔐 **Sécurité intégrée**
#### 🧨 2. OwnershipTool.ps1
- — Le cœur du système

》》 🔐 **Sécurité intégrée**
- Le script bloque automatiquement les actions sur les dossiers critiques :
```text
- Blocage automatique des zones critiques
- Vérification du chemin
- Logs militaires LEGION-UHD
- Confirmation obligatoire
```

- 》》 🟩 **Action : TakeOwnership**
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

- 》》 🟦 **Action : RestoreTrustedInstaller**
》》》 🟦 **Action : RestoreTrustedInstaller**
```text
icacls "<path>" /setowner "NT SERVICE\TrustedInstaller" /t
```

- 》》 🟥 **Action : NativeACL** (*moteur C++*)
```text
OwnerAdminACL.exe --path "<path>" --mode FullControl
```

- 》》 💻 **Mode Hacker**
```text
- ASCII art militaire
- HUD complet (TPM, BitLocker, SecureBoot, OSInfo)
- Recon Ghost Recon (VBS, HVCI, DeviceGuard, SecureKernel)
```

---

### 🧭 Roadmap OwnerAdmin v3.0
- — Black ICE Edition

```text
》》》 🔥 Fonctionnalités prévues
- ☐ Mode Stealth (logs invisibles)
- ☐ Module SDDL Analyzer
- ☐ Interface graphique WPF minimaliste
- ☐ Intégration LegionUHD Ops
- ☐ Signature numérique du script PowerShell
- ☐ Support multi‑langues (FR / EN / ES)
- ☐ Mode Black ICE (opérations extrêmes)
- ☐ Recon réseau (ports, services, firewall)
- ☐ Module KernelGuard (drivers suspects)
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
- 》》 **The MadDoG.tmdg** 
```text
》》 Créateur du projet OwnerAdmin v1.6 / v2.0  
》》 Style militaire • Ghost Recon • LEGION‑UHD
```
- **The MadDoG.tmdg** 
- *Créateur du projet OwnerAdmin v1.6* 
- *Licence personnelle incluse dans le dépôt*.

---

### 📜 Licence
***Voir fichier LICENSE***.
- 》》**Voir fichier LICENSE**.

---

###### 🟩 README.md >> markdown v2.0 est prêt.
