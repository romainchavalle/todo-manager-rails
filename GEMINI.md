# Directives de Développement & Protocole de Validation

Ce fichier définit les règles strictes et permanentes de comportement pour l'assistant IA sur ce projet.

## 1. Protocole de Validation Granulaire (Obligatoire)
- **Explication Préalable** : Avant toute implémentation ou modification de code, présenter l'approche technique, la structure des fichiers et la justification des choix d'ingénierie.
- **Explication Détaillée du Code** : Chaque bloc de code produit doit être expliqué clairement (rôle des méthodes, flux de données, validations, conventions).
- **Validation Explicite par l'Utilisateur** : Ne jamais enchaîner plusieurs étapes d'un coup. Attendre systématiquement la validation explicite de l'utilisateur à la fin de chaque sous-étape avant de poursuivre.
- **Réponses Ciblées** : Rester concis et direct. Ne faire de comparaisons conceptuelles approfondies qu'à la demande explicite de l'utilisateur.

## 2. Standards d'Architecture & Clean Code
- **Architecture par Domaines** : Respecter l'organisation `app/domains/` (`identity`, `task_management`, `project_management`, `analytics`).
- **The Rails Way & Propreté** : Code idiomatique Ruby on Rails 7.2.
- **Séparation Stricte des Responsabilités (SRP)** :
  - *Layouts* : `auth.html.erb` pour les flux d'accès, `application.html.erb` pour l'app connectée.
  - *Modèles* : validations, associations, enums, scopes.
  - *Contrôleurs* : légers (Skinny Controllers).
  - *Services* : opérations métier complexes ou transactionnelles.
  - *Queries* : requêtes SQL analytiques / agrégations pour les dashboards.
  - *Policies* : sécurité déclarative et isolation stricte Pundit.
  - *Helpers* : formatage de présentation UI.

## 3. Intelligibilité & Lisibilité Humaine (Zéro Style IA)
- **Zéro Commentaire IA Verbeux** : Aucun commentaire redondant ou superflu dans le code source. Le code doit être expressif, élégant et auto-documenté.
- **Conventions & Nommage Explicite** : Variables, méthodes et classes au nommage clair et standard, compréhensible immédiatement par un évaluateur technique senior.
