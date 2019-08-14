require 'faker'
require 'json'
require 'open-uri'

puts 'Cleaning database...'
User.destroy_all
Pet.destroy_all
Booking.destroy_all

categories = ["Domestic Animals", "Exotic Animals", "Mythical Creatures", "Aquatic Animals", "Insects"]

puts 'Creating users...'
User.create(first_name: "Khoa", last_name: "Le", email: "khoa@gmail.com", password: "khoa123")
User.create(first_name: "Danko", last_name: "Beribak", email: "danko@gmail.com", password: "danko123")
User.create(first_name: "Arman", last_name: "Balani", email: "arman@gmail.com", password: "arman123")
User.create(first_name: "Melissa", last_name: "Lobuescher", email: "melissa@gmail.com", password: "melissa123")

puts 'Creating pets...'

20.times do
  val = rand(1..4)
  if val == 1 # Fox
    photo = JSON.parse(open("https://randomfox.ca/floof/").read)["image"]
    species = "Fox"
  elsif val == 2 # Dog
    photo = JSON.parse(open("https://random.dog/woof.json").read)["url"]
    species = "Dog"
  elsif val == 3 # Goat
    photo = "https://placegoat.com/200/200"
    species = "Goat"
  elsif val == 4
    photo = JSON.parse(open("https://aws.random.cat/meow").read)["file"]
    species = "Cat"
  end
  pet = Pet.new(
    name: Faker::Name.name,
    category: categories.sample,
    age: rand(1..20),
    price_per_day: rand(10..50),
    species: species,
  )
  pet.remote_photo_url = photo
  pet.user = User.all.sample
  pet.save!
end

puts "Finished..."
