===============================
OwnerAdmin v1.6 – reg/ directory
===============================

Ce dossier contient les fichiers d’intégration Windows permettant
d’ajouter ou de retirer les commandes OwnerAdmin dans le menu contextuel
(clic droit).

Les fichiers .reg inclus dans ce dossier ajoutent deux fonctionnalités :

1. **Take Ownership (Mode Sécurisé + Hacker Mode)**
   - Ajoute une entrée dans le menu contextuel pour prendre possession
     d’un fichier ou dossier.
   - Appelle le script PowerShell avec :
     - Sécurité activée
     - Confirmation obligatoire
     - Interface Hacker (ASCII art)
   - Fonctionne sur :
     - Tous les fichiers
     - Tous les dossiers

2. **Restore TrustedInstaller**
   - Restaure le propriétaire d’origine : ``NT SERVICE\TrustedInstaller``.
   - Inclut confirmation et interface Hacker.

-------------------
Contenu du dossier
-------------------

- ``InstallTakeOwnership.reg``  
  Installe les entrées TakeOwnership et RestoreTrustedInstaller.

- ``RemoveTakeOwnership.reg``  
  Supprime toutes les entrées OwnerAdmin du menu contextuel.

- ``ContextMenu.reg``  
  Version brute des clés utilisées par OwnerAdmin.

-------------------
Installation
-------------------

1. Copier ``OwnershipTool.ps1`` dans :

::

   C:\Tools\

2. Double‑cliquer sur ``InstallTakeOwnership.reg`` pour installer
   les entrées dans le registre.

3. Pour supprimer les entrées, utiliser ``RemoveTakeOwnership.reg``.

-------------------
Avertissement
-------------------

Les fichiers .reg modifient le registre Windows.  
Assurez-vous de comprendre les actions avant installation.
