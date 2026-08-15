User.destroy_all

manager = User.create!(
  first_name: "Jean",
  last_name: "Manager",
  email: "manager@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: :manager
)

employees = [
  { first_name: "Alice", last_name: "Martin", email: "alice@example.com" },
  { first_name: "Bob", last_name: "Dupont", email: "bob@example.com" },
  { first_name: "Charlie", last_name: "Durand", email: "charlie@example.com" }
].map do |attrs|
  User.create!(
    attrs.merge(
      password: "password123",
      password_confirmation: "password123",
      role: :employee
    )
  )
end

puts "✅ Seeds créés avec succès :"
puts "   - 1 Manager : #{manager.email} (#{manager.full_name})"
employees.each do |emp|
  puts "   - 1 Employé : #{emp.email} (#{emp.full_name})"
end
