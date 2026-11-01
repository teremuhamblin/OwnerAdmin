===============================
OwnerAdmin v1.6 – scripts/ directory
===============================

Ce dossier contient le script principal du projet : ``OwnershipTool.ps1``.
Il s’agit du module PowerShell responsable de toutes les opérations
de prise de possession et de restauration TrustedInstaller.

-------------------
Fonctionnalités
-------------------

Le script inclut les fonctionnalités suivantes :

1. **Prise de possession sécurisée**
   - Utilise ``takeown`` pour récupérer la propriété d’un fichier ou dossier.
   - Utilise ``icacls`` pour accorder les droits complets au groupe
     ``Administrators``.

2. **Restauration TrustedInstaller**
   - Rétablit le propriétaire d’origine :
     ``NT SERVICE\TrustedInstaller``.

3. **Mode sécurisé**
   - Empêche toute action sur les répertoires critiques :
     - ``C:\Windows\System32``
     - ``C:\Windows\WinSxS``
     - ``C:\Windows\Boot``
     - ``C:\Program Files``
     - ``C:\Program Files (x86)``
   - Si la cible se trouve dans une zone protégée, l’action est bloquée.

4. **Confirmation obligatoire**
   - Avant chaque action, le script demande une validation utilisateur.

5. **Mode Hacker**
   - Affichage ASCII art style “terminal militaire”.
   - Interface vert/noir inspirée des HUD tactiques.
   - Activé via le paramètre ``-HackerMode 1``.

-------------------
Utilisation
-------------------

Le script est appelé automatiquement par les fichiers .reg via :

::

   powershell.exe -File "C:\\Tools\\OwnershipTool.ps1" -Action <ACTION> -Path "<TARGET>" -HackerMode 1

Paramètres :

- ``-Action`` : ``TakeOwnership`` ou ``RestoreTrustedInstaller``
- ``-Path`` : chemin du fichier ou dossier ciblé
- ``-HackerMode`` : active l’interface stylée (optionnel)

-------------------
Installation
-------------------

1. Copier ``OwnershipTool.ps1`` dans :

::

   C:\Tools\

2. Importer les fichiers .reg situés dans ``reg/``.

-------------------
Avertissement
-------------------

Ce script modifie les permissions NTFS.  
Une mauvaise utilisation peut rendre certains fichiers inaccessibles.
Utiliser uniquement sur des fichiers non système.
