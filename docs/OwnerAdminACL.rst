===========================================
OwnerAdminACL — Documentation Technique
===========================================

OwnerAdminACL est le moteur natif C++ utilisé par OwnerAdmin pour
manipuler les ACL NTFS, activer les privilèges système, et exécuter
des opérations bas-niveau impossibles à réaliser uniquement via PowerShell.

Sommaire
--------

- Objectif
- Fonctionnement
- Privilèges système
- Manipulation des ACL
- Compilation
- Intégration PowerShell
- Sécurité
- Limitations
- Roadmap

Objectif
--------

OwnerAdminACL permet :

- d’activer ``SeTakeOwnershipPrivilege``,
- de prendre possession d’un fichier,
- de modifier les ACL NTFS,
- d’ajouter une ACE à un utilisateur ou groupe,
- d’appliquer des permissions personnalisées.

Fonctionnement
--------------

Le moteur utilise les API Windows suivantes :

- ``GetNamedSecurityInfo``
- ``SetEntriesInAcl``
- ``SetNamedSecurityInfo``
- ``LookupPrivilegeValue``
- ``AdjustTokenPrivileges``

Privilèges système
------------------

OwnerAdminACL active :

- ``SeTakeOwnershipPrivilege`` — prise de possession
- ``SeRestorePrivilege`` — restauration ACL
- ``SeBackupPrivilege`` — lecture forcée

Manipulation des ACL
--------------------

Exemple d’appel interne :

.. code-block:: cpp

   AddAceToObjectsSecurityDescriptor(
       "C:\\test.txt",
       SE_FILE_OBJECT,
       "Administrators",
       TRUSTEE_IS_NAME,
       GENERIC_READ | GENERIC_WRITE,
       GRANT_ACCESS,
       0
   );

Compilation
-----------

Compiler avec MSVC :

.. code-block:: bash

   cl /EHsc /nologo /FeOwnerAdminACL.exe OwnerAdminACL.cpp /link Advapi32.lib

Intégration PowerShell
----------------------

.. code-block:: powershell

   $exe = "$PSScriptRoot/native/OwnerAdminACL.exe"
   & $exe $Path $User

Sécurité
--------

- Exécution locale uniquement
- Manipulation contrôlée des privilèges
- Journalisation des actions sensibles
- Utilisation réservée aux administrateurs

Limitations
-----------

- Fonctionne uniquement sur Windows NTFS
- Nécessite des privilèges administrateur
- Ne modifie pas les SACL (audit)

Roadmap
-------

- v2.0 — TrustedInstaller Restore natif
- v2.5 — ACL Scanner
- v3.0 — Native Security Engine complet
