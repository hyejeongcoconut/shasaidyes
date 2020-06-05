# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
# THE INCREDIBLES ACCOUNTS:
User.destroy_all
Guest.destroy_all
Vendor.destroy_all
Product.destroy_all

h = User.new(
  first_name: "Hyejeong",
  last_name: "Kwon",
  email: "hyejeongcoconut@test.com",
  password:"123456"
)
puts "You has unlocked a new character Hyejeong created!"


h.photo.attach(io: File.open('app/assets/images/me.jpg'), filename: 'me.jpg', content_type: 'image/jpg')
h.save!


m = User.new(
  first_name: "Michelle",
  last_name: "Kim",
  email: "michelle@test.com",
  password:"123456"
)
puts "You has unlocked a new character Michelle done!"


file = File.open('app/assets/images/YmdI9lLq_400x400.jpg')
m.photo.attach(io: file, filename: 'michelle.jpg', content_type: 'image/jpg')
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



# all = User.all
# ids = []

# all.each {|x| ids << x.id }

# 20.times do
#   Guest.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone_number:Faker::PhoneNumber.cell_phone,
#     address: Faker::Address.street_address,
#     email: Faker::Internet.email,
#     rsvp: 0,
#     additional_guest_numbers: rand(1..5),
#     food_preference: preferences.sample,
#     user_id: ids.sample
#   )
#   puts "Done !"
# end
#------vendor seed ----------------------------------------------------------------------------------------
category = Vendor::CATEGORY
lovingyou = Vendor.new(
  email: "hello@lovingyou.co.kr",
  name: "Loving You",
  password: "123123",
  category: "Reception Venue",
  phone_number: "01034591234",
  description: "Loving You wishes all our brides to feel special.",
  address: "haeundae-gu, busan, Republic of Korea",
  city: "Seoul"
)
puts "loving you created"

lovingyou.photo.attach(io:URI.open('https://res.cloudinary.com/dambigbiy/image/upload/v1590480340/aia9bviwps2uh9l7m3h4.jpg'), filename: 'wedding.jpeg', content_type: 'image/jpeg')
lovingyou.save!

amor = Vendor.new(
  email: "hello@amor.co.kr",
  name: "Amor",
  password: "123123",
  category: "Reception Venue",
  phone_number: "01034591232",
  description: "Whether you're looking for a small wedding venue or a large reception space, explore thousands of options",
  address: "haeundae-gu, busan, Republic of Korea",
  city: "Seoul"
)
puts "Amor created"

amor.photo.attach(io: URI.open('https://runawayjuno.com/wp-content/uploads/2015/04/Stephen-Juno-Wedding-blog-2948.jpg'), filename: 'koreanwedding.jpg', content_type: 'image/jpg')
amor.save!

brideandyou = Vendor.new(
  email: "hello33@brideandyou.co.kr",
  name: "Bride and You",
  password: "123123",
  category: "Wedding Dresses",
  phone_number: "01034591230",
  description: "Designer heels",
  address: "130-9, ChungDam-dong, GangNam-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "Brideandyou created"

brideandyou.photo.attach(io:URI.open('https://res.cloudinary.com/dambigbiy/image/upload/v1590482032/brzmgfksyrddgmxiuds3.jpg'), filename: 'wedding1.jpg', content_type: 'image/jpg')
brideandyou.save!

yujin = Vendor.new(
  email: "hello33@yujin.co.kr",
  name: "Yujin",
  password: "123123",
  category: "Wedding Dresses",
  phone_number: "01034591330",
  description: "BHLDN’s style is playful and modern with an air of something heavenly.",
  address: "130-20, Sindang-dong, GangNam-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "yujin created"

yujin.photo.attach(io:URI.open('https://www.angelicabridal.co.uk/wp-content/uploads/2019/09/our-bridal-store.jpg'), filename: 'wedding9.jpg', content_type: 'image/jpg')
yujin.save!

asos = Vendor.new(
  email: "hello@asos.co.kr",
  name: "ASOS",
  password: "123123",
  category: "Photographer",
  phone_number: "01034534230",
  description: "commercial, lifestyle, and portrait photographer",
  address: "34 Noksapyeong-ro, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "asos created"

asos.photo.attach(io:URI.open('http://wedding-photography.pro/wp-content/uploads/2018/03/warsaw-wedding-photography.jpg'), filename: 'weddingo.jpg', content_type: 'image/jpg')
asos.save!

forresty = Vendor.new(
  email: "hello@forresty.co.kr",
  name: "Forresty Y",
  password: "123123",
  category: "Photographer",
  phone_number: "01034598888",
  description: "For the something we will treasure forever.",
  address: "Jangan-dong, Dongdaemun-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "Forresty Y created"

forresty.photo.attach(io:File.open('app/assets/images/forresty.jpg'), filename: 'wedding6.jpg', content_type: 'image/jpg')
forresty.save!

musickorea = Vendor.new(
  email: "hello33@musickorea.co.kr",
  name: "music korea",
  password: "123123",
  category: "Music & Entertainment",
  phone_number: "01034591230",
  description: "Looking for the perfect Wedding Music & Entertainment in Seoul, Korea? ",
  address: "500, ChungDam-dong, GangNam-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "musickorea created"

musickorea.photo.attach(io:URI.open('http://superdavedj.com/wp-content/uploads/2015/08/sd8.1.jpg'), filename: 'wedding4.jpg', content_type: 'image/jpg')
musickorea.save!

boogie = Vendor.new(
  email: "hello33@boogie.co.kr",
  name: "Boogie Entertainment DJ Service",
  password: "123123",
  category: "Music & Entertainment",
  phone_number: "01034591560",
  description: "The company has been providing exceptional service since 1996 and is dedicated to making their DJ services as memorable as the event itself.",
  address: "130-9, Jung-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "Boogie Entertainment DJ Service created"

boogie.photo.attach(io:URI.open('https://www.pianodj.co.uk/wordpress/wp-content/uploads/2018/10/wedding-dj-agency-nottinghamshire-cost-prices-professional-disco-hazel-gap-barn.jpg'), filename: 'wedding3.jpg', content_type: 'image/jpg')
boogie.save!

maria = Vendor.new(
  email: "hello@maria.co.kr",
  name: "Maria",
  password: "123123",
  category: "Bridal Salon",
  phone_number: "01033421340",
  description: "Maria is an upscale salon in Seoul’s Hongdae neighborhood",
  address: "Mapo-gu, Seogyo-dong, 334 1 2nd floor, hongdae, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "maria created"

maria.photo.attach(io:URI.open('https://www.weddingideasmag.com/wp-content/uploads/2013/10/wedding-hair-accessories-flower-crown-bride-hair-650x433.jpg'), filename: 'wedding12.jpg', content_type: 'image/jpg')
maria.save!

salute = Vendor.new(
  email: "hello@salute.co.kr",
  name: "Salute hair salon",
  password: "123123",
  category: "Bridal Salon",
  phone_number: "01034530030",
  description: "excellent reputation for stylish, trendy cuts.",
  address: "130-9, 83 Dongmak-ro, Sangsu-dong, Mapo-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "salute created"

salute.photo.attach(io:URI.open('https://www.miramira-hairandbeauty.co.uk/wp-content/uploads/2016/11/wedding.png'), filename: 'weddving1.png', content_type: 'image/png')
salute.save!

sweetiri = Vendor.new(
  email: "hello33@sweetiri.co.kr",
  name: "Sweet Iri",
  password: "123123",
  category: "Wedding Cakes",
  phone_number: "01034321245",
  description: "Designer heels",
  address: "34-4 Hosu-ro 856beon-gil, Daehwa-dong, Ilsanseo-gu, Goyang-si, Gyeonggi-do, Republic of Korea",
  city: "Goyang-si"
)
puts "sweetiri created"

sweetiri.photo.attach(io:URI.open('https://www.kellylou.com/wp3/wp-content/uploads/2016/06/ballymagarvey09.05.jpg'), filename: 'wvding1.jpg', content_type: 'image/jpg')
sweetiri.save!

parisbaguetto = Vendor.new(
  email: "hello@parisbaguetto.co.kr",
  name: "Paris Baguetto",
  password: "123123",
  category: "Wedding Cakes",
  phone_number: "01089645678",
  description: "Special Cake for your special moment",
  address: "Yeonhui-dong, 132-51 2F, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "parisbaguetto created"

parisbaguetto.photo.attach(io:URI.open('http://www.kellylou.com/wp3/wp-content/uploads/2016/06/2016-04-23-18.04.56-3.jpg'), filename: 'weddidng1.jpg', content_type: 'image/jpg')
parisbaguetto.save!

honeybee = Vendor.new(
  email: "hello@honeybee.co.kr",
  name: "honeybee",
  password: "123123",
  category: "Honeymoon Package",
  phone_number: "01056345633",
  description: "Once in a Lifetime Experience",
  address: "130-9, ChungDam-dong, GangNam-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "honeybee created"

honeybee.photo.attach(io:URI.open('https://www.zowed.com/blog/wp-content/uploads/2019/01/honeymoon-destinations.jpg'), filename: 'wedddsing1.jpg', content_type: 'image/jpg')
honeybee.save!

wheretogo = Vendor.new(
  email: "hello33@wheretogo.co.kr",
  name: "Where to Go Travel Tours",
  password: "123123",
  category: "Honeymoon Package",
  phone_number: "01044443325",
  description: "Choose us for extending the wedding fun and have a memorable time.",
  address: "7 Dongho-ro 24-gil, Jangchung-dong, Jung-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "wheretogo created"

wheretogo.photo.attach(io:URI.open('https://www.shadibox.com/blog/wp-content/uploads/2018/06/blogs-aisle-say-paris-honeymoon-hotels.jpg'), filename: 'weddiwwng1.jpg', content_type: 'image/jpg')
wheretogo.save!

laluce = Vendor.new(
  email: "hello@laluce.co.kr",
  name: "laluce",
  password: "123123",
  category: "Reception Venue",
  phone_number: "01034591348",
  description: "Perfect place for small and private wedding.",
  address: "Euler 128b, Polanco 11510 México, D.F. Mexico",
  city: "Mexico city"
)
puts "laluce created"

laluce.photo.attach(io:URI.open('https://res.cloudinary.com/dambigbiy/image/upload/v1590482344/mbkpx1xjolb0ll8zkwa5.jpg'), filename: 'wedding21.jpg', content_type: 'image/jpg')
laluce.save!

matan = Vendor.new(
  email: "hello@matan.co.kr",
  name: "matan",
  password: "123123",
  category: "Catering",
  phone_number: "01067443452",
  description: "large or small, We're happy to cater your event.",
  address: "48 Usadan-ro 14-gil, Yongsan-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "matan created"

matan.photo.attach(io:URI.open('https://www.moneycrashers.com/wp-content/uploads/2019/03/cheap-wedding-reception-food-drink-menu-1068x713.jpg'), filename: 'wedding21.jpg', content_type: 'image/jpg')
matan.save!

kimchitaco = Vendor.new(
  email: "hello@kimchitaco.co.kr",
  name: "kimchi taco",
  password: "123123",
  category: "Catering",
  phone_number: "01056744534",
  description: "Mexican food plus kimchi for small and private wedding.",
  address: "41 Wausan-ro, Seogang-dong, Mapo-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "kimchitaco created"

kimchitaco.photo.attach(io:URI.open('https://www.liveeatlearn.com/wp-content/uploads/2019/11/vegetarian-kimchi-tacos-2.jpg'), filename: 'wefdsdding21.jpg', content_type: 'image/jpg')
kimchitaco.save!
#------------------------------------------------ product's seed --------------------------------------------------------------------


lovingyoupro = Product.new(
  name: Faker::Ancient.god,
  price: Faker::Commerce.price,
  description: "best product's in the world",
  category: "Reception Venue",
  vendor_id: 1
)
puts "lovingyoupro okay"

lovingyoupro.photos.attach(io:URI.open('http://www.paolocicognani.com/wp-content/uploads/2015/01/Mainpicture.jpg'), filename: 'wefddsdding21.jpg', content_type: 'image/jpg')
lovingyoupro.save!

lovingyoupro.photos.attach(io:URI.open('https://img.traveltriangle.com/blog/wp-content/uploads/2018/10/wedding-venues-berlin-cover-img.jpg'), filename: 'wefddsg21.jpg', content_type: 'image/jpg')
lovingyoupro.save!

yujinproduct = Product.new(
  name: Faker::Ancient.god,
  price: Faker::Commerce.price,
  description: "Sexy, Cute, beautiful",
  category: "Wedding Dresses",
  vendor_id: 4
)
puts "Yujin okay"

yujinproduct.photos.attach(io:URI.open('https://www.kleinfeldbridal.com/wp-content/uploads/2019/07/pronovias-3-4-sleeve-beaded-illusion-ball-gown-34110551-450x600.jpg'), filename: 'wefdddddsdding21.jpg', content_type: 'image/jpg')
yujinproduct.save!

yujinproduct.photos.attach(io:URI.open('https://www.kleinfeldbridal.com/wp-content/uploads/2020/02/vanilla-sposa-3-4-sleeve-lace-ball-gown-wedding-dress-34182436-400x600.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
yujinproduct.save!














#------quote's seed -----------------------------------------------------------------------------------------

# service = ["shoes", "dress", "venue", "flower"]
# vendor = [laluce, brideandyou, lovingyou]
# all = User.all
# ids = []

# all.each {|x| ids << x.id }


# 5.times do
#   Quote.create(
#     total_price: Faker::Number.between(from: 1000000, to: 50000000),
#     list_of_services: service.sample,
#     date: Faker::Date.forward(days: 4),
#     booked: true,
#     vendor: vendor.sample,
#     user_id: ids.sample
#   )
#   puts "created"
# end
