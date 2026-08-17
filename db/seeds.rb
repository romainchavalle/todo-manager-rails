User.destroy_all
Project.destroy_all
Task.destroy_all

manager = User.create!(
  first_name: "Jean",
  last_name: "Manager",
  email: "manager@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: :manager
)

alice = User.create!(
  first_name: "Alice",
  last_name: "Martin",
  email: "alice@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: :employee
)

bob = User.create!(
  first_name: "Bob",
  last_name: "Dupont",
  email: "bob@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: :employee
)

charlie = User.create!(
  first_name: "Charlie",
  last_name: "Durand",
  email: "charlie@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: :employee
)

p1 = Project.create!(
  name: "Refonte Application",
  description: "Modernisation de l'interface utilisateur et des performances de l'application.",
  color: "#4f46e5",
  status: :active,
  creator: manager
)

p2 = Project.create!(
  name: "Onboarding RH",
  description: "Parcours d'intégration et documentation des nouveaux collaborateurs.",
  color: "#0284c7",
  status: :active,
  creator: manager
)

Task.create!([
  {
    title: "Concevoir les maquettes du tableau de bord",
    description: "Créer les wireframes haute fidélité pour le pilotage manager et les KPI d'équipe.",
    status: :in_progress,
    priority: :high,
    creator: manager,
    assignee: alice,
    project: p1
  },
  {
    title: "Rédiger le guide d'accueil des employés",
    description: "Documenter les accès outils, canaux Slack et processus internes.",
    status: :todo,
    priority: :medium,
    creator: manager,
    assignee: alice,
    project: p2
  },
  {
    title: "Optimiser les requêtes SQL des tâches",
    description: "Vérifier les index composites PostgreSQL et supprimer les requêtes N+1.",
    status: :completed,
    priority: :urgent,
    creator: manager,
    assignee: bob,
    project: p1
  },
  {
    title: "Mettre en place la documentation d'architecture",
    description: "Schématiser l'architecture par domaine et les politiques Pundit.",
    status: :todo,
    priority: :low,
    creator: manager,
    assignee: charlie,
    project: p1
  }
])

puts "✅ Seeds injectés avec succès :"
puts "   - 1 Manager (#{manager.email})"
puts "   - 3 Employés (Alice, Bob, Charlie)"
puts "   - 2 Projets (#{p1.name}, #{p2.name}) liés au Manager"
puts "   - 4 Tâches initiales"
