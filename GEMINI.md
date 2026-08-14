# Directives de Développement & Protocole de Validation

Ce fichier définit les règles strictes de comportement pour l'assistant IA sur ce projet.

## 1. Protocole de Validation Granulaire (Obligatoire)
- **Explication Préalable** : Avant toute implémentation ou modification de code, présenter l'approche technique, la structure des fichiers et la justification des choix.
- **Explication Détaillée du Code** : Chaque bloc de code produit doit être expliqué clairement (rôle des méthodes, flux de données, validations, conventions).
- **Validation Explicite par l'Utilisateur** : Ne jamais enchaîner plusieurs étapes d'un coup. Attendre systématiquement la validation explicite de l'utilisateur à la fin de chaque sous-étape avant de poursuivre.

## 2. Standards de Code & Architecture
- **Architecture par Domaines** : Respecter l'organisation `app/domains/` (`identity`, `task_management`, `project_management`, `analytics`).
- **The Rails Way & Propreté** : Code idiomatique Ruby on Rails 7.2.
- **Zéro Code Style IA** : Aucun commentaire verbeux, redondant ou superflu dans le code source. Le code doit être expressif et auto-documenté.
- **Séparation des Responsabilités** :
  - *Modèles* : validations, associations, enums, scopes.
  - *Contrôleurs* : légers (Skinny Controllers).
  - *Services* : opérations multi-modèles ou transactionnelles.
  - *Queries* : requêtes SQL analytiques / agrégations.
  - *Policies* : sécurité déclarative Pundit.
  - *Helpers* : formatage de présentation UI.
