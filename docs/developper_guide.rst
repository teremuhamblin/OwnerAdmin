===============================
Guide Développeur
===============================

Objectif
========
Décrire les conventions de développement, les normes internes et les
procédures de test.

Conventions de Code
===================
* Structure : Init / Security / Action / Log  
* Utilisation de ``Try/Catch``  
* Messages opérateur formatés (HUD tactique)  
* Couleurs via ``Write-Host``  

Tests
=====
* Tests ACL sur fichiers non critiques  
* Tests TrustedInstaller sur DLL isolée  
* Tests SecureBoot / BitLocker sur VM Windows  
* Validation REG via Sandbox  

Déploiement
===========
.. code-block:: powershell

   powershell -ExecutionPolicy Bypass -File .\install.ps1
