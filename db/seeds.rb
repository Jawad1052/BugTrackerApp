# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
## db/seeds.rb
# db/seeds.rb
Role.create(name: 'developer', actual_name: 'Developer')               # ID: 1
Role.create(name: 'admin', actual_name: 'Administrator')    # ID: 2
Role.create(name: 'manager', actual_name: 'Manager')         # ID: 3

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?