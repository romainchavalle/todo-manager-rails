# Architecture Technique & Choix de Conception

## 1. Vision Globale & Principes d'Ingénierie

Cette application est construite comme un **cas d'école technique senior** respectant les standards de production modernes :
- **The Rails Way** : Utilisation idiomatique des conventions Ruby on Rails 7.2.
- **Domain-Driven / Feature Packaging** : Organisation par domaines métiers (`app/domains/`) pour une maintenabilité et une scalabilité optimales.
- **Code Propre & Intelligible** : Code expressif et auto-documenté, sans commentaires superflus ou verbeux.
- **Zero Heavy JS Framework** : Réactivité assurée par **Hotwire** (Turbo Frames, Turbo Streams) et des contrôleurs Stimulus légers.
- **Sécurité Déclarative** : Gestion des autorisations via **Pundit** (politiques explicites et scopes stricts).

---

## 2. Organisation Modulaire par Domaines (`app/domains/`)

Pour dépasser la structure monolithique par couches techniques et faciliter la navigation par fonctionnalité métier, l'application est découpée en 4 domaines :

```text
app/
├── domains/
│   ├── identity/                  # Authentification, Rôles & Gestion des Utilisateurs
│   │   ├── models/                # User (Devise)
│   │   ├── controllers/           # UsersController, Registrations/Sessions custom
│   │   ├── services/              # Logique métier liée aux utilisateurs
│   │   └── helpers/               # Formatage utilisateur / avatar
│   │
│   ├── task_management/           # Gestion complète des tâches & transitions d'état
│   │   ├── models/                # Task (statuts, priorités, scopes)
│   │   ├── controllers/           # TasksController (CRUD + Turbo updates)
│   │   ├── services/              # AssignTaskService, UpdateTaskStatusService
│   │   ├── policies/              # TaskPolicy (isolation des listes employé vs manager)
│   │   ├── helpers/               # TasksHelper (badges, dates relatives)
│   │   └── views/tasks/           # Vues et partiels Turbo
│   │
│   ├── project_management/        # Gestion des projets & assignations
│   │   ├── models/                # Project (associations, statuts)
│   │   ├── controllers/           # ProjectsController (CRUD Manager, lecture Employé)
│   │   ├── policies/              # ProjectPolicy
│   │   └── views/projects/
│   │
│   └── analytics/                 # Tableaux de bord & indicateurs de performance
│       ├── controllers/           # DashboardsController
│       ├── queries/               # DashboardStatsQuery (agrégations SQL optimisées)
│       ├── policies/              # DashboardPolicy (accès réservé Manager)
│       ├── helpers/               # DashboardHelper (calculs graphiques)
│       └── views/dashboards/      # Vues KPI + Canvas Chart.js
│
└── shared/                        # Éléments transversaux à toute l'application
    ├── views/layouts/             # Layout principal et Sidebar responsive
    ├── helpers/                   # ApplicationHelper (flash, UI components)
    └── javascript/                # Contrôleurs Stimulus (chart, modal, autosubmit)
```

---

## 3. Rôles des Couches Métier

| Couche | Emplacement | Responsabilité |
| :--- | :--- | :--- |
| **Modèles** | `domains/*/models/` | Définition des schémas, contraintes, validations ActiveRecord, enums et scopes. |
| **Contrôleurs** | `domains/*/controllers/` | Contrôleurs légers (*Skinny Controllers*), orchestration HTTP, gestion des formats HTML / Turbo Stream. |
| **Services** | `domains/*/services/` | Encapsulation des règles métier transactionnelles ou multi-modèles (ex: réassignation, notification). |
| **Queries** | `domains/*/queries/` | Requêtes SQL complexes et calculs analytiques groupés (évite les problèmes N+1 et allège les contrôleurs). |
| **Policies** | `domains/*/policies/` | Règles d'autorisation Pundit déclaratives et testables unitairement. |
| **Helpers** | `domains/*/helpers/` | Helpers de présentation pour alléger les vues ERB. |

---

## 4. Stack Technique & Infrastructure

- **Langage & Framework** : Ruby 3.3 / Rails 7.2
- **Base de données** : PostgreSQL 16 (avec clés étrangères, contraintes d'intégrité et index composites)
- **Authentification** : `Devise`
- **Autorisation** : `Pundit`
- **Frontend / Réactivité** : Hotwire (Turbo 8 + Stimulus 3)
- **Data Visualization** : Chart.js (intégré proprement via contrôleur Stimulus)
- **Asset Pipeline** : Propshaft + Importmap
- **Tests** : RSpec Rails + FactoryBot + Faker
- **Conteneurisation** : Docker & Docker Compose
