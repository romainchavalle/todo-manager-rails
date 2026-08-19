puts "Nettoyage de la base de données..."
Task.destroy_all
Project.destroy_all
User.destroy_all

puts "Création des utilisateurs..."
manager = User.create!(
  first_name: "Jean",
  last_name: "Dupont",
  email: "manager@example.com",
  password: "password123",
  role: :manager
)

alice = User.create!(
  first_name: "Alice",
  last_name: "Martin",
  email: "alice@example.com",
  password: "password123",
  role: :employee
)

bob = User.create!(
  first_name: "Bob",
  last_name: "Lefebvre",
  email: "bob@example.com",
  password: "password123",
  role: :employee
)

charlie = User.create!(
  first_name: "Charlie",
  last_name: "Moreau",
  email: "charlie@example.com",
  password: "password123",
  role: :employee
)

puts "Création des projets..."
project1 = Project.create!(
  name: "Refonte Application",
  description: "Migration vers Rails 7.2 et modernisation de l'UI/UX.",
  color: "#4f46e5",
  status: :active,
  creator: manager
)

project2 = Project.create!(
  name: "API Mobile V2",
  description: "Création des endpoints REST pour l'application iOS et Android.",
  color: "#0284c7",
  status: :active,
  creator: manager
)

puts "Création des tâches avec complexités..."
Task.create!(
  title: "Auditer les dépendances et Gemfile",
  description: "Mettre à jour les gems critiques et tester la compatibilité Ruby 3.3.",
  status: :completed,
  priority: :high,
  complexity: :simple, # 1 pt
  creator: manager,
  assignee: alice,
  project: project1
)

Task.create!(
  title: "Implémenter l'authentification Devise et rôles",
  description: "Mettre en place Devise avec les rôles manager et employé.",
  status: :in_progress,
  priority: :urgent,
  complexity: :complex, # 3 pts
  creator: manager,
  assignee: alice,
  project: project1
)

Task.create!(
  title: "Refactorer l'architecture globale de la base de données",
  description: "Créer les migrations, les index composites et les clés étrangères.",
  status: :todo,
  priority: :medium,
  complexity: :heavy, # 5 pts
  creator: manager,
  assignee: bob,
  project: project1
)

Task.create!(
  title: "Concevoir la documentation Swagger / OpenAPI",
  description: "Rédiger le contrat d'interface pour les équipes mobiles.",
  status: :todo,
  priority: :low,
  complexity: :medium, # 2 pts
  creator: manager,
  assignee: charlie,
  project: project2
)

puts "Seed terminé avec succès !"
puts "Projet 1 points d'effort : #{project1.completed_effort_points}/#{project1.total_effort_points} (#{project1.completion_percentage}%)"
