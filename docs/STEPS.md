# Feuille de Route & Journal de Validation des Étapes

Ce document trace l'état d'avancement et la validation étape par étape du projet.

---

## Statut des Étapes

### ✅ Étape 1 : Socle Technique & Environnement Docker / PostgreSQL
- **Statut** : Validée
- **Livrables** :
  - `Dockerfile` & `docker-compose.yml` (PostgreSQL 16 + Ruby 3.3 + Rails 7.2.3).
  - Configuration de base (`database.yml`, `puma.rb`, `Rakefile`, `config.ru`).
  - Serveur opérationnel et répondant 200 OK sur le port 3000.
  - Définition de l'architecture documentaire (`docs/`).

---

### ⏳ Étape 2 : Domaine `identity` (User, Authentification Devise & Rôles)
- **Statut** : En cours
- **Objectifs** :
  - Configuration de l'autoloading Zeitwerk pour `app/domains/`.
  - Installation & configuration de Devise dans `app/domains/identity/`.
  - Modèle `User` avec enum `role: { employee: 0, manager: 1 }` et méthodes helpers.
  - Vues d'authentification personnalisées et ergonomiques.
  - Seeds de test (1 Manager démo, 3 Employés démo).

---

### 📋 Étape 3 : Domaine `task_management` & `project_management` (Modèles, Migrations & Validations)
- **Statut** : À venir
- **Objectifs** :
  - Migrations `projects` et `tasks` avec clés étrangères et index de performance.
  - Associations ActiveRecord, validations et scopes utiles (`overdue`, `due_soon`, `by_status`).
  - Services d'assignation et de transition d'état.

---

### 📋 Étape 4 : Politiques d'Autorisation (Pundit) & Isolation des Rôles
- **Statut** : À venir
- **Objectifs** :
  - `TaskPolicy` (avec `TaskPolicy::Scope` strict : employé = ses tâches, manager = tout).
  - `ProjectPolicy` et `DashboardPolicy`.
  - Gestion des erreurs `Pundit::NotAuthorizedError` avec redirection et alertes adaptées.

---

### 📋 Étape 5 : Interface Utilisateur & Intégration Hotwire (Turbo Frames & Streams)
- **Statut** : À venir
- **Objectifs** :
  - Layout principal avec Sidebar responsive et dynamique selon le rôle.
  - Liste de tâches avec changement d'état 1-clic via Turbo Frame sans rechargement.
  - Filtres instantanés et formulaires modaux Turbo.

---

### 📋 Étape 6 : Domaine `analytics` (Dashboard Manager & Graphiques Chart.js)
- **Statut** : À venir
- **Objectifs** :
  - `DashboardStatsQuery` (calculs SQL groupés et optimisés).
  - Intégration du contrôleur Stimulus `chart_controller.js` pour Chart.js.
  - Cartes KPI (tâches en retard, complétion, répartition par employé).

---

### 📋 Étape 7 : Tests Automatisés (RSpec) & Jeu de Démo Final
- **Statut** : À venir
- **Objectifs** :
  - Tests unitaires des policies Pundit (couverture critique des autorisations).
  - Tests des services et query objects.
  - Jeu de données de démonstration complet (`db/seeds.rb`).
