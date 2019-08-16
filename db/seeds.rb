require 'faker'
require 'json'
require 'open-uri'

puts 'Cleaning database...'
User.destroy_all
Pet.destroy_all
Booking.destroy_all
Review.destroy_all

categories = ["Domestic Animals", "Exotic Animals", "Mythical Creatures", "Aquatic Animals", "Insects"]
cities = ["Paris", "Barcelona", "New York", "London", "Madison", "Madrid", "Ho Chi Minh", "Ha Noi", "Los Angeles", "Skopje", "Curacao", "Berlin"]
species = ["dog", "cat", "goat", "bunny", "fox"]
dogs = ["https://images.unsplash.com/photo-1530281700549-e82e7bf110d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80", "https://images.unsplash.com/photo-1507146426996-ef05306b995a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80", "https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80", "https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=987&q=80", "https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=933&q=80", "https://images.unsplash.com/photo-1521673461164-de300ebcfb17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"]
cats = ["https://images.unsplash.com/photo-1507984211203-76701d7bb120?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2104&q=80", "https://images.unsplash.com/photo-1548366086-7f1b76106622?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=924&q=80", "https://images.unsplash.com/photo-1501820488136-72669149e0d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80", "https://images.unsplash.com/photo-1518843025960-d60217f226f5?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80", "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&auto=format&fit=crop&w=976&q=80"]
goats = ["https://images.unsplash.com/photo-1533318087102-b3ad366ed041?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80", "https://images.unsplash.com/photo-1529763062018-cd9b9ede3a80?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80", "https://images.unsplash.com/photo-1532633378163-24c2c0da3c99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1867&q=80", "https://images.unsplash.com/photo-1538724426109-5c5dce0bd7f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2132&q=80", "https://images.unsplash.com/photo-1563906832557-b53ca701b251?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80"]
bunnies = ["https://images.unsplash.com/photo-1452857297128-d9c29adba80b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1867&q=80", "https://images.unsplash.com/photo-1535241749838-299277b6305f?ixlib=rb-1.2.1&auto=format&fit=crop&w=984&q=80",
"https://images.unsplash.com/photo-1511542229800-663a99ca1817?ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80", "https://images.unsplash.com/photo-1514917073844-2f691ae526c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2104&q=80", "https://images.unsplash.com/photo-1540776747361-eb6c2c4ce695?ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80"]
foxs = ["https://images.unsplash.com/photo-1462953491269-9aff00919695?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80", "https://images.unsplash.com/photo-1540428562593-4d82f4083688?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80", "https://images.unsplash.com/photo-1522162363424-d29ded2ad958?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1867&q=80", "https://images.unsplash.com/photo-1496702986477-21e0355f962b?ixlib=rb-1.2.1&auto=format&fit=crop&w=2330&q=80", "https://images.unsplash.com/photo-1500621137413-1a61d6ac1d44?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"]
images = {
  "dog" => dogs,
  "cat" => cats,
  "goat" => goats,
  "bunny" => bunnies,
  "fox" => foxs
}

puts 'Creating users...'
khoa = User.create!(first_name: "Khoa", last_name: "Le", email: "khoa@gmail.com", password: "khoa123")
danko = User.create!(first_name: "Danko", last_name: "Beribak", email: "danko@gmail.com", password: "danko123")
arman = User.create!(first_name: "Arman", last_name: "Balani", email: "arman@gmail.com", password: "arman123")
melissa = User.create!(first_name: "Melissa", last_name: "Lobuescher", email: "melissa@gmail.com", password: "melissa123")
pet_owners = [khoa, danko, arman, melissa]
puts "User count 1st time: #{User.count}"

# puts 'Creating pets...'

20.times do
  pet_species = species.sample
  city = cities.sample
  owner = User.all.sample
  pet = Pet.create!(species: pet_species,
    name: Faker::Name.first_name,
    address: city,
    city: city,
    age: rand(1..20),
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat doloribus repellendus odit praesentium soluta, suscipit excepturi ipsa adipisci aliquam, cum laudantium tempora totam possimus, quisquam labore facere a dicta deserunt!",
    category: categories.sample,
    remote_photo_url: images[pet_species].sample,
    price_per_day: rand(10..100),
    user: owner)

  if pet.valid?
    owner.mark_owner
  end
end

User.create!(first_name: "Xinyi", last_name: "Abc", email: "xinyi@gmail.com", password: "xinyi123")
User.create!(first_name: "Ellyn", last_name: "Abc", email: "ellyn@gmail.com", password: "ellyn123")
User.create!(first_name: "Daniel", last_name: "Abc", email: "daniel@gmail.com", password: "daniel123")
User.create!(first_name: "Avalon", last_name: "Abc", email: "avalon@gmail.com", password: "avalon123")
User.create!(first_name: "Gus", last_name: "Abc", email: "gus@gmail.com", password: "gus123")
User.create!(first_name: "Valerie", last_name: "Abc", email: "valerie@gmail.com", password: "valerie123")
User.create!(first_name: "Lorenzo", last_name: "Abc", email: "lorenzo@gmail.com", password: "lorenzo123")

puts "User count 2nd time: #{User.count}"

50.times do
  rentor = User.all.sample
  pet = Pet.where.not(user: rentor).sample
  start_date = Date.new(2019, rand(2..8), rand(1..28))
  end_date = Date.new(2019, rand(7..12), rand(1..28))
  unless start_date >= end_date
    booking = Booking.create!(
      start_date: start_date,
      end_date: end_date,
      user: rentor,
      pet: pet
      )
    booking.total_price = booking.compute_price(pet.price_per_day)
    booking.save!
  end
end

puts "Number of bookings: #{Booking.count}"

puts "Creating reviews"

100.times do
  booking = Booking.all.sample
  review = Review.create!(
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat doloribus repellendus odit praesentium soluta, suscipit excepturi ipsa adipisci aliquam, cum laudantium tempora totam possimus, quisquam labore facere a dicta deserunt!",
    stars: rand(1..5),
    booking: booking,
    pet: booking.pet
    )
end

# 20.times do
#   photo = ""
#   species = ""
#   val = rand(1..4)
#   if val == 1 # Fox
#     photo = JSON.parse(open("https://randomfox.ca/floof/").read)["image"]
#     species = "Fox"
#   elsif val == 2 # Dog
#     photo = JSON.parse(open("https://random.dog/woof.json").read)["url"]
#     species = "Dog"
#   elsif val == 3 # Goat
#     photo = "https://placegoat.com/200/200"
#     species = "Goat"
#   elsif val == 4
#     photo = JSON.parse(open("https://aws.random.cat/meow").read)["file"]
#     species = "Cat"
#   end
#   pet = Pet.new(
#     name: Faker::Name.name,
#     category: categories.sample,
#     age: rand(1..20),
#     price_per_day: rand(10..50),
#     species: species
#   )
#   pet.remote_photo_url = photo
#   pet.user = User.all.sample
#   pet.save!
# end

puts "Finished..."
