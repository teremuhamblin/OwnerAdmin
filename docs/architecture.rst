===============================
Architecture Technique
===============================

Objectif
========
Décrire la structure interne du projet ``OwnerAdmin`` ainsi que les
flux de permissions Windows (ACL, SDDL, TrustedInstaller).

Structure du Projet
===================

.. code-block:: text

   OwnerAdmin/
    ├── scripts/
    │    ├── OwnershipTool.ps1
    │    └── SystemSecurity.psm1
    ├── reg/
    │    └── ContextMenu.reg
    ├── docs/
    ├── VERSION.md
    ├── CHANGELOG.md
    └── ROADMAP.md

Flux ACL
========
* Lecture ACL via ``Get-Acl``  
* Modification via ``Set-Acl``  
* Gestion des SDDL pour héritage et propagation  
* Restauration TrustedInstaller via SID ``NT SERVICE\TrustedInstaller``  

Modules Internes
================
* ``OwnershipTool.ps1`` — moteur principal  
* ``SystemSecurity.psm1`` — audit TPM / BitLocker / SecureBoot  
* ``Logger`` (optionnel) — journalisation avancée  

Zones Critiques
===============
Les chemins suivants sont protégés :

* ``C:\Windows\System32\``  
* ``C:\Windows\WinSxS\``  
* ``C:\Windows\Boot\``  
* ``C:\Windows\servicing\``  

Compatibilité
=============
Compatible Windows 10 / 11 — PowerShell 5.1.
