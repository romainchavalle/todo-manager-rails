# Standards & Architecture Front-end

## 1. Organisation Modulaire du CSS (`app/assets/stylesheets/`)
- `base/` : variables de design (`variables.css`) et reset/typographie (`reset.css`).
- `components/` : composants UI réutilisables (`buttons.css`, `forms.css`, `alerts.css`, `badges.css`, `sidebar.css`).
- `domains/` : styles spécifiques à chaque domaine métier (`auth.css`, `tasks.css`, `projects.css`, `dashboard.css`).
- `application.css` : point d'entrée unique contenant uniquement les déclarations `@import`.

## 2. Principes Graphiques
- **Design Épuré & Moderne** : Palette sombre soignée (`slate-900` / `indigo-600`), contrastes accessibles.
- **Micro-interactions** : Transitions douces (`0.2s cubic-bezier`), hover states sur les boutons et cartes.
- **Zéro Framework Lourd** : Vanilla CSS moderne + Propshaft.
