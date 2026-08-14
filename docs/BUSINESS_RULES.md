# Règles Métiers & Matrice des Droits

## 1. Modélisation des Rôles

Le système distingue deux types d'utilisateurs via un enum ActiveRecord :
1. **`employee` (0)** : Collaborateur opérationnel.
2. **`manager` (1)** : Responsable d'équipe / Chef de projet.

---

## 2. Matrice des Droits d'Accès

| Fonctionnalité | Rôle Employé | Rôle Manager | Sécurité / Policy |
| :--- | :--- | :--- | :--- |
| **Authentification** | Inscription, connexion, gestion de profil | Inscription, connexion, gestion de profil | Devise |
| **Accès Dashboard** | ⛔ Refusé (Redirect + Flash alert) |  Accès complet aux graphiques & KPI | `DashboardPolicy#show?` |
| **Consultation Tâches** |  Uniquement les tâches qui lui sont assignées |  Toutes les tâches (filtrables par employé/projet) | `TaskPolicy::Scope` |
| **Création de Tâche** |  Pour lui-même uniquement (auto-assignée) |  Pour lui-même ou n'importe quel collaborateur | `TaskPolicy#create?` |
| **Modification Tâche** |  Sur ses tâches (titre, desc, statut, échéance) |  Sur toutes les tâches + réassignation d'employé | `TaskPolicy#update?` |
| **Changement de Statut** |  Sur ses tâches (1-clic Turbo Frame) |  Sur toutes les tâches | `TaskPolicy#update_status?` |
| **Suppression Tâche** |  Uniquement les tâches créées par lui |  Sur toutes les tâches | `TaskPolicy#destroy?` |
| **Gestion Projets** | 👁️ Lecture des projets assignés |  CRUD complet (Création, modification, archivage) | `ProjectPolicy` |

---

## 3. Cycle de Vie & États des Tâches

### Statuts (`status`) :
- **`pending` (0)** : Tâche créée, non commencée.
- **`in_progress` (1)** : Tâche en cours de traitement.
- **`done` (2)** : Tâche finalisée.

### Priorités (`priority`) :
- **`low` (0)** : Priorité basse.
- **`medium` (1)** : Priorité normale.
- **`high` (2)** : Priorité haute / urgente.

---

## 4. Métriques & Calculs du Tableau de Bord (Analytics)

Le Dashboard Manager s'appuie sur `DashboardStatsQuery` pour calculer en temps réel :
1. **Taux de complétion global** : `(Tâches terminées / Total tâches) * 100`
2. **Tâches en retard (`overdue`)** : `due_date < Date.current AND status != done`
3. **Répartition de la charge de travail** : Nombre de tâches actives (`pending` + `in_progress`) par employé.
4. **Avancement par projet** : Ratio des tâches terminées par projet actif.
