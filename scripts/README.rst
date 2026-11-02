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

scripts/native/ — Moteur ACL Natif (C++)
========================================

Ce sous-dossier contient les modules **natif Windows (C++)** utilisés par OwnerAdmin
pour exécuter des opérations système avancées impossibles à réaliser uniquement en PowerShell.

Il constitue le **backend bas-niveau** du projet, permettant la manipulation directe
des privilèges Windows, des ACL NTFS et des DACL.

Sommaire
--------

- Rôle du dossier
- Contenu
- Intégration dans OwnerAdmin
- Sécurité
- Pourquoi un module natif ?

Rôle du dossier
---------------

Le dossier ``scripts/native/`` fournit un moteur ACL natif permettant :

- l’activation de privilèges système sensibles (ex : ``SeTakeOwnershipPrivilege``),
- la prise de possession de fichiers ou dossiers,
- la modification des ACL NTFS,
- l’ajout ou la suppression d’ACE dans les DACL,
- l’application de permissions personnalisées pour un utilisateur ou un groupe.

Ce module renforce OwnerAdmin en lui donnant une **puissance système militaire**,
au-delà des capacités de PowerShell.

Contenu
-------

- **OwnerAdminACL.cpp**  
  Code source C++ permettant :
  
  - d’activer les privilèges système,
  - de prendre possession d’un fichier,
  - de modifier les ACL NTFS,
  - d’ajouter une ACE à un utilisateur ou groupe.

- **OwnerAdminACL.exe**  
  Version compilée du moteur ACL natif, appelée directement par OwnerAdmin.

Intégration dans OwnerAdmin
---------------------------

OwnerAdmin utilise ce module via PowerShell :

.. code-block:: powershell

   $nativeExe = Join-Path $PSScriptRoot "native/OwnerAdminACL.exe"
   & $nativeExe "C:\test.txt" "Administrators"

Ce moteur est utilisé dans les modes :

- ``UltraTakeOwnership``
- ``ACL Reset``
- ``TrustedInstaller Restore``
- ``Native ACL Engine``

Sécurité
--------

- Exécution locale uniquement.
- Manipulation contrôlée des privilèges Windows.
- Utilisation réservée aux opérations administratives.
- Compatible avec les mécanismes de sécurité d’OwnerAdmin.

Pourquoi un module natif ?
--------------------------

Certaines opérations NTFS nécessitent :

- un accès bas-niveau,
- des API Windows natives,
- une gestion directe des ACL,
- une activation de privilèges système.

Le module natif apporte à OwnerAdmin une **capacité d’intervention système**
impossible à obtenir uniquement via PowerShell.

Il constitue la base du futur **OwnerAdmin Native Security Engine**.
