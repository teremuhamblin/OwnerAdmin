===========================================
OwnerAdmin v1.6 — Outil Tactique NTFS (RST)
===========================================

OwnerAdmin est un outil d’administration Windows permettant de
prendre ou restaurer la propriété NTFS de fichiers et dossiers,
modifier les ACL, analyser la sécurité, et exécuter des opérations
système avancées via PowerShell et modules natifs C++.

Il s’agit d’un utilitaire tactique inspiré des environnements
militaires, conçu pour les opérateurs nécessitant un contrôle
total sur les permissions NTFS.

Sommaire
--------

- Présentation
- Fonctionnalités
- Architecture
- Installation
- Utilisation
- Modules natifs (C++)
- Sécurité
- Mode Hacker
- Troubleshooting
- Roadmap
- Licence

Présentation
------------

OwnerAdmin v1.6 fournit :

- prise de propriété NTFS,
- restauration TrustedInstaller,
- modification des ACL,
- vérification des privilèges système,
- logs tactiques couleur,
- interface opérateur,
- module natif C++ pour opérations bas-niveau.

Fonctionnalités
---------------

- ✔ Prise de propriété NTFS (Take Ownership)
- ✔ Restauration TrustedInstaller
- ✔ Modification des ACL (lecture, écriture, héritage)
- ✔ Mode opérateur « Hacker Mode »
- ✔ Journalisation couleur
- ✔ Vérification TPM / BitLocker / SecureBoot
- ✔ Compatible Windows 10 / 11
- ✔ Module natif C++ pour ACL avancées

Architecture
------------

.. code-block:: text

   OwnerAdmin/
     scripts/
       OwnershipTool.ps1
       SystemSecurity.psm1
       native/
         OwnerAdminACL.cpp
         OwnerAdminACL.exe
     docs/
       README.rst
       OwnerAdminACL.rst
     reg/
       ContextMenu.reg
     logs/
     .github/
       workflows/
         build.yml

Installation
------------

1. Copier le dossier ``scripts/`` dans un emplacement sécurisé.
2. Importer ``ContextMenu.reg`` pour ajouter les options au menu contextuel.
3. Vérifier la politique d’exécution PowerShell :

.. code-block:: powershell

   Set-ExecutionPolicy RemoteSigned

4. Tester l’outil :

.. code-block:: powershell

   powershell.exe -File OwnershipTool.ps1 -Test

Utilisation
-----------

Menu contextuel :

- **Take Ownership** — Prend la propriété NTFS
- **Restore TrustedInstaller** — Restaure le propriétaire système

Exécution directe :

.. code-block:: powershell

   powershell.exe -File OwnershipTool.ps1 -Path "C:\\test.txt" -Take
   powershell.exe -File OwnershipTool.ps1 -Path "C:\\test.txt" -Restore

Modules natifs (C++)
--------------------

Le dossier ``scripts/native/`` contient le moteur ACL natif :

- activation de ``SeTakeOwnershipPrivilege``,
- modification directe des ACL NTFS,
- ajout d’ACE,
- prise de possession bas-niveau.

Intégration PowerShell :

.. code-block:: powershell

   $exe = "$PSScriptRoot/native/OwnerAdminACL.exe"
   & $exe "C:\\test.txt" "Administrators"

Sécurité
--------

- Vérification des privilèges administrateur
- Blocage des chemins critiques (System32, WinSxS)
- Journalisation des actions sensibles
- Mode « Silent Ops » pour opérations discrètes
- Protection contre les modifications non autorisées

Mode Hacker
-----------

Affiche un tableau tactique :

- TPM ✔ / ✘
- BitLocker ✔ / ✘
- SecureBoot ✔ / ✘
- Version OS
- Privilèges actifs

Troubleshooting
---------------

- ❌ Accès refusé  
  → Vérifier les privilèges admin

- ❌ Script bloqué  
  → ``Set-ExecutionPolicy RemoteSigned``

- ❌ TrustedInstaller introuvable  
  → Vérifier que Windows Modules Installer est actif

Roadmap
-------

- v2.0 — Native Security Engine complet
- v2.5 — Interface graphique
- v3.0 — Analyse ACL avancée
- v4.0 — Mode opérateur militaire étendu

Licence
-------

MIT — libre d’utilisation.
