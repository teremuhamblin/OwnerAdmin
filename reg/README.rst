===============================
OwnerAdmin v1.6 – reg/ directory
===============================

Ce dossier contient les fichiers d’intégration Windows permettant
d’ajouter les commandes OwnerAdmin dans le menu contextuel (clic droit).

Les fichiers .reg inclus dans ce dossier ajoutent deux fonctionnalités :

1. **Take Ownership (Safe • Hacker Mode)**
   - Ajoute une entrée dans le menu contextuel pour prendre
     possession d’un fichier ou dossier.
   - Appelle le script PowerShell avec :
     - Sécurité activée
     - Confirmation obligatoire
     - Mode Hacker (ASCII art, interface stylée)
   - Fonctionne sur :
     - Tous les fichiers
     - Tous les dossiers

2. **Restore TrustedInstaller (Hacker Mode)**
   - Ajoute une entrée permettant de restaurer le propriétaire
     d’origine : ``NT SERVICE\TrustedInstaller``.
   - Inclut confirmation et mode Hacker.

-------------------
Contenu du fichier
-------------------

Le fichier ``OwnerAdmin_ContextMenu.reg`` crée les clés suivantes :

- ``HKEY_CLASSES_ROOT\*\shell\TakeOwnershipHacker``
- ``HKEY_CLASSES_ROOT\Directory\shell\TakeOwnershipHacker``
- ``HKEY_CLASSES_ROOT\*\shell\RestoreTrustedInstallerHacker``
- ``HKEY_CLASSES_ROOT\Directory\shell\RestoreTrustedInstallerHacker``

Chaque entrée appelle PowerShell :

::

   powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "C:\\Tools\\OwnershipTool.ps1" -Action <ACTION> -Path "%1" -HackerMode 1

-------------------
Installation
-------------------

1. Copier le script PowerShell dans ``C:\Tools\``.
2. Double‑cliquer sur ``OwnerAdmin_ContextMenu.reg`` pour importer
   les entrées dans le registre Windows.

-------------------
Avertissement
-------------------

Les fichiers .reg modifient le registre Windows.  
Assurez-vous de comprendre les actions avant installation.
