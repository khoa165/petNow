# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Pet.destroy_all

categories = ["Domestic Animals", "Exotic Animals", "Mythical Creatures", "Aquatic Animals", "Insects"]

User.create!(email: "asdfg@gmail.com", password: "helloworld")

5.times do
  Pet.create!(
    name: Faker::Name.name,
    category: categories.sample,
    species: Faker::Creature::Animal.name,
    age: rand(1..100),
    price_per_day: rand(1..100),
    user_id: 1
  )
end
