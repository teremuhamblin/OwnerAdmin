===============================
Guide Opérateur
===============================

Objectif
========
Fournir les procédures d’engagement pour les opérateurs utilisant
``OwnerAdmin``.

Prendre Possession
==================
.. code-block:: powershell

   .\OwnershipTool.ps1 -Take "C:\Target\File.dll"

Restauration TrustedInstaller
=============================
.. code-block:: powershell

   .\OwnershipTool.ps1 -Restore "C:\Target\File.dll"

Mode Recon
==========
.. code-block:: powershell

   .\OwnershipTool.ps1 -Scan Security

Protocoles d’Engagement
=======================
* Toujours restaurer TrustedInstaller après modification  
* Ne jamais intervenir dans ``System32`` sans justification  
* Vérifier les logs après chaque opération  

Compatibilité
=============
Fonctionne en environnement durci (GPO, AppLocker).
