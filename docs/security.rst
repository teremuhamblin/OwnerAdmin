===============================
Sécurité & Audit Système
===============================

Objectif
========
Décrire les mécanismes de sécurité intégrés dans ``OwnerAdmin`` ainsi
que les audits système disponibles.

Audit TPM
=========
* Vérification de l’état TPM  
* Version du firmware  
* Support PCR  

Audit BitLocker
===============
* Statut du volume  
* Méthode de chiffrement  
* Protection active  

Audit SecureBoot
================
* Activation  
* Validation des signatures  
* Mode de sécurité  

Protection des Chemins
======================
Le moteur interne bloque toute tentative d’action sur les zones
sensibles du système Windows.

Privilèges
==========
* Vérification automatique du rôle Administrateur  
* Refus d’exécution en contexte non privilégié  

Journalisation
==============
* Succès (vert)  
* Avertissement (jaune)  
* Erreur (rouge)
