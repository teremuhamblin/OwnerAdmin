===========================================
Documentation — OwnerAdmin v1.6 (Dossier docs/)
===========================================

Le dossier ``docs/`` contient l’ensemble de la documentation officielle du
projet OwnerAdmin v1.6. Il regroupe les fichiers de gouvernance, les guides
d’installation, les notes techniques et les modules natifs documentés.

Cette documentation est compatible Sphinx et peut être utilisée pour générer
un site complet ou un manuel technique.

Sommaire
--------

- Présentation du dossier
- Structure
- Fichiers de gouvernance
- Guides d’installation
- Documentation technique
- Intégration Sphinx
- Roadmap documentaire

Présentation du dossier
-----------------------

Le dossier ``docs/`` centralise toutes les informations nécessaires pour :

- comprendre l’architecture d’OwnerAdmin,
- suivre l’évolution du projet,
- installer les modules,
- consulter les guides techniques,
- documenter les modules natifs (C++),
- préparer les futures versions.

Structure
---------

.. code-block:: text

   docs/
     README.rst
     CHANGELOG.md
     ROADMAP.md
     guides/
       install_windows.rst
       install_context_menu.rst
       install_native_engine.rst
     OwnerAdminACL.rst

Fichiers de gouvernance
-----------------------

Deux fichiers essentiels assurent la gouvernance du projet :

- **CHANGELOG.md**  
  Historique complet des versions, corrections, améliorations et évolutions.

- **ROADMAP.md**  
  Plan d’évolution du projet, objectifs des futures versions, modules prévus.

Ces fichiers permettent de suivre la progression du projet et d’assurer une
vision claire de son développement.

Guides d’installation
---------------------

Le dossier ``guides/`` contient les guides pratiques pour installer OwnerAdmin
et ses composants :

- **install_windows.rst**  
  Installation générale sur Windows 10/11.

- **install_context_menu.rst**  
  Ajout du menu contextuel (Take Ownership / Restore TrustedInstaller).

- **install_native_engine.rst**  
  Installation du moteur ACL natif (C++).

Chaque guide est rédigé en ReStructuredText et compatible avec Sphinx.

Documentation technique
-----------------------

La documentation technique inclut :

- **OwnerAdminACL.rst**  
  Documentation du moteur ACL natif (C++), incluant :
  
  - activation des privilèges,
  - manipulation des ACL,
  - compilation,
  - intégration PowerShell,
  - sécurité.

Intégration Sphinx
------------------

Le dossier ``docs/`` est prêt pour une intégration Sphinx :

- index.rst
- toctree
- modules
- guides
- gouvernance

Exemple de ``index.rst`` :

.. code-block:: rst

   .. toctree::
      :maxdepth: 2
      :caption: Documentation OwnerAdmin

      README
      CHANGELOG
      ROADMAP
      guides/install_windows
      guides/install_context_menu
      guides/install_native_engine
      OwnerAdminACL

Roadmap documentaire
--------------------

- v2.0 — Ajout du Native Security Engine
- v2.5 — Documentation GUI
- v3.0 — Analyse ACL avancée
- v4.0 — Manuel opérateur militaire
