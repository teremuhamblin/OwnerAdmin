= Intégration Shell Windows — OwnerAdmin (REG)
:author: Teremu
:revdate: 2026-11-01
:toc: left

== Objectif
Ce dossier contient les fichiers .reg permettant l’intégration d’OwnerAdmin dans le Shell Windows via le menu contextuel.

== Contenu
* ContextMenu.reg — ajoute :
** Take Ownership
** Restore TrustedInstaller
* Uninstall.reg — suppression propre des entrées
* SafeContext.reg — version durcie (zones protégées)

== Fonctionnement
Les fichiers REG utilisent :
* HKCR\*\shell\
* HKCR\Directory\shell\
* Command handlers PowerShell
* Appels directs vers OwnershipTool.ps1 avec arguments dynamiques

== Sécurité
* Exécution bloquée sur chemins critiques
* Vérification des privilèges administrateur
* Compatible Windows 10 / 11
* Fonctionne en environnements durcis (GPO, AppLocker)

== Installation
[source,reg]
----
Windows Registry Editor Version 5.00
; Double‑clic pour installer
----
