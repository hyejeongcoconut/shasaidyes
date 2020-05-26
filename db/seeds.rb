# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# THE INCREDIBLES ACCOUNTS:
User.destroy_all
Guest.destroy_all


h = User.new(
  first_name: "Hyejeong",
  last_name: "Kwon",
  email: "hyejeongcoconut@test.com",
  password:"123456"
  )
puts "You has unlocked a new character Hyejeong created!"

h.photo.attach(io: URI.open('https://d29zunrt9sid73.cloudfront.net/speaker_media/asset/28695/portrait_70_28695.png'), filename: 'pokemon.png', content_type: 'image/png')
h.save!

m = User.new(
  first_name: "Michelle",
  last_name: "Kim",
  email: "michelle@test.com",
  password:"123456"
  )
puts "You has unlocked a new character Michelle done!"

m.photo.attach(io: URI.open('https://d29zunrt9sid73.cloudfront.net/speaker_media/asset/28695/portrait_70_28695.png'), filename: 'pokemon.png', content_type: 'image/png')
m.save!

y = User.new(
  first_name: "Yiro",
  last_name: "Yi",
  email: "yiroyi@test.com",
  password:"123456"
  )
puts "You has unlocked a new character Yiro done!"

y.photo.attach(io: URI.open('https://d29zunrt9sid73.cloudfront.net/speaker_media/asset/28695/portrait_70_28695.png'), filename: 'pokemon.png', content_type: 'image/png')
y.save!

preferences = ["Kimchi","Tostadas","Burguers","Malaxiangguo"]

all = User.all
ids = []

all.each {|x| ids << x.id }

20.times do
  Guest.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number:Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    email: Faker::Internet.email,
    rsvp: 0,
    additional_guest_numbers: rand(1..5),
    food_preference: preferences.sample,
    user_id: ids.sample
    )
  puts 'Done !'
end
