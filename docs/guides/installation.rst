===========================================
🔧 Installation — OwnerAdmin v1.6
===========================================

-------------------------
📦 Prérequis
-------------------------

- ✔️ Windows 10/11
- ✔️ PowerShell 5.1 ou 7+
- ✔️ Droits administrateur
- ✔️ CRLF pour les fichiers .reg

-------------------------
📁 Installation des scripts
-------------------------

1. Créer le dossier :

::

   C:\Tools\

2. Copier :

::

   OwnershipTool.ps1

-------------------------
🗂️ Installation du menu contextuel
-------------------------

Double-cliquer :

- ✔️ InstallTakeOwnership.reg  
- ✔️ ContextMenu.reg

Pour supprimer :

- ✔️ RemoveTakeOwnership.reg

-------------------------
🔐 Vérification
-------------------------

Exécuter :

::

   powershell -File C:\Tools\OwnershipTool.ps1 -Check
