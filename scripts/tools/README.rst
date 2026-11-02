tools/ — Scripts Utilitaires
============================

Le dossier ``tools/`` contient des scripts simples utilisés pour
les opérations de maintenance et de nettoyage dans OwnerAdmin v1.6.

Sommaire
--------

- Présentation
- Contenu
- Utilisation

Présentation
------------

Les scripts du dossier ``tools/`` ne modifient pas les ACL NTFS.
Ils servent uniquement à effectuer des tâches de maintenance
complémentaires avant ou après l'exécution des modules principaux.

Contenu
-------

- **fix.bat**  
  Supprime les fichiers ``*.lck`` et ``*.lock`` dans le dossier courant
  et ses sous-dossiers. Utile pour débloquer certains répertoires avant
  une prise de possession.

- **fix.ps1**  
  Version PowerShell du nettoyage des fichiers de verrouillage,
  compatible avec l'environnement OwnerAdmin.

Utilisation
-----------

Depuis PowerShell :

.. code-block:: powershell

   & "$PSScriptRoot/tools/fix.bat"
   & "$PSScriptRoot/tools/fix.ps1"

Ces scripts sont optionnels et destinés à la maintenance du système.
