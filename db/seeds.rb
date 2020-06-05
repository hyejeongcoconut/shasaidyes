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

#------vendor + product seed ----------------------------------------------------------------------------------------
category = Vendor::CATEGORY
lovingyou = Vendor.new(
  email: "hello@lovingyou.co.kr",
  name: "Loving You",
  password: "123123",
  category: "Wedding Venue",
  phone_number: "01034591234",
  description: "Loving You wishes all our brides to feel special. Providing wedding parties with the venues of their dreams",
  address: "haeundae-gu, busan, Republic of Korea",
  city: "Seoul"
)
puts "loving you created"

lovingyou.photo.attach(io:URI.open('https://res.cloudinary.com/dambigbiy/image/upload/v1590480340/aia9bviwps2uh9l7m3h4.jpg'), filename: 'wedding.jpeg', content_type: 'image/jpeg')
lovingyou.save!


lovingyoupro = Product.new(
  name: "Wedding halls and reception venues",
  price: Faker::Commerce.price,
  description: "Discount wedding venues and reception halls.",
  category: "Wedding Venue",
  vendor_id: 1
)
puts "lovingyoupro okay"

lovingyoupro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/466/311/an-elegant-wedding-hall-with-well-arranged-tables-and-chairs.jpg'), filename: 'wd1.jpg', content_type: 'image/jpg')
lovingyoupro.save!

lovingyoupro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/389/434/white-concrete-building-near-body-of-water-during-daytime.jpg'), filename: 'wd2.jpg', content_type: 'image/jpg')
lovingyoupro.save!

# -------------------
# -------------------
amor = Vendor.new(
  email: "hello@amor.co.kr",
  name: "Amor",
  password: "123123",
  category: "Wedding Venue",
  phone_number: "01034591232",
  description: "Whether you're looking for a small wedding venue or a large reception space, explore thousands of options",
  address: "haeundae-gu, busan, Republic of Korea",
  city: "Seoul"
)
puts "Amor created"

amor.photo.attach(io: URI.open('https://runawayjuno.com/wp-content/uploads/2015/04/Stephen-Juno-Wedding-blog-2948.jpg'), filename: 'koreanwedding.jpg', content_type: 'image/jpg')
amor.save!

amorproduct = Product.new(
  name: "Elegant Wedding Hall",
  category: "Wedding Venue",
  price: Faker::Commerce.price,
  description: "An elegant wedding hall with well arranged tables and chairs",
  vendor_id: 2
)
puts "amor okay"

amorproduct.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/953/88/white-tablecloth-on-brown-table.jpg'), filename: 'wefdddddsdding21.jpg', content_type: 'image/jpg')
amorproduct.save!

amorproduct.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/340/394/selective-focus-photography-of-white-and-pink-petaled-flowers-near-chairs.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
amorproduct.save!


# -------------------
# -------------------

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

cproduct = Product.new(
  name: "Wedding dresses and Bridal Party dresses",
  price: Faker::Commerce.price,
  description: "The best wedding dresses, plus-size wedding dresses, and bridal accessories in the Seoul area",
  category: "Wedding Dresses",
  vendor_id: 3
)
puts "c okay"

cproduct.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/606/421/group-of-women-in-pink-dresses-standing-on-green-grass-field-during-daytime.jpg'), filename: 'ddddress1.jpg', content_type: 'image/jpg')
cproduct.save!

cproduct.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/484/210/women-s-white-wedding-dress.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
cproduct.save!

# -------------------
# -------------------

yujin = Vendor.new(
  email: "hello33@yujin.co.kr",
  name: "Yujin Designer Dresses",
  password: "123123",
  category: "Wedding Dresses",
  phone_number: "01034591330",
  description: "Designer Yujin's most exquisite style is playful and modern with an air of something heavenly.",
  address: "130-20, Sindang-dong, GangNam-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "yujin created"

yujin.photo.attach(io:URI.open('https://www.angelicabridal.co.uk/wp-content/uploads/2019/09/our-bridal-store.jpg'), filename: 'wedding9.jpg', content_type: 'image/jpg')
yujin.save!


yujinproduct = Product.new(
  name: "Designer wedding dresses",
  price: Faker::Commerce.price,
  description: "Yujin designs her entire collection independently and has employed master craftsmen
based in Seoul,Korea to bring her creations to life.",
  category: "Wedding Dresses",
  vendor_id: 4
)
puts "Yujin okay"

yujinproduct.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/701/360/white-lace-floral-lace-textile.jpg'), filename: 'wefdddddsdding21.jpg', content_type: 'image/jpg')
yujinproduct.save!

yujinproduct.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/277/103/white-and-gold-floral-textile.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
yujinproduct.save!


# -------------------
# -------------------

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


dproduct = Product.new(
  name: "Commercial Wedding Photography",
  price: Faker::Commerce.price,
  description: "It is essential to choose a Wedding Photographer wisely! We will ensure that you get quality photographs you really want to keep and treasure.",
  category: "Wedding Dresses",
  vendor_id: 5
)
puts "Yujin okay"

dproduct.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/409/732/woman-in-white-dress-walking-on-sidewalk-during-daytime.jpg'), filename: 'wefdddddsdding21.jpg', content_type: 'image/jpg')
dproduct.save!

dproduct.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/148/402/man-in-black-suit-jacket-taking-photo-of-woman-in-white-wedding-dress.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
dproduct.save!




# -------------------
# -------------------

forresty = Vendor.new(
  email: "hello@forresty.co.kr",
  name: "Forresty Photography",
  password: "123123",
  category: "Photographer",
  phone_number: "01034598888",
  description: "Originally from Shanghai, photographer Forrest will provide natural creative candid photography for your wedding photos, pre wedding photos, portraits and so much more",
  address: "Jangan-dong, Dongdaemun-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "Forresty Y created"

forresty.photo.attach(io:File.open('app/assets/images/forresty.jpg'), filename: 'wedding6.jpg', content_type: 'image/jpg')
forresty.save!

epro = Product.new(
  name: "Boutique Wedding Photography and Videography Package Deal",
  price: Faker::Commerce.price,
  description: "It is essential to choose a Wedding Photographer wisely! We will ensure that you get quality photographs you really want to keep and treasure.",
  category: "Photographer",
  vendor_id: 6
)
puts "Yujin okay"

epro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/220/492/woman-in-wedding-gown-photo.jpg'), filename: 'wefdddddsdding21.jpg', content_type: 'image/jpg')
epro.save!

epro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/231/280/grascale-photo-of-wedding-couple-kissing.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
epro.save!
# -------------------
# -------------------


musickorea = Vendor.new(
  email: "hello33@musickorea.co.kr",
  name: "Music Korea",
  password: "123123",
  category: "Music & Entertainment",
  phone_number: "01034591230",
  description: "Looking for the perfect Wedding Music & Entertainment in Seoul, Korea? Chat with us now!",
  address: "500, ChungDam-dong, GangNam-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "musickorea created"

musickorea.photo.attach(io:URI.open('http://superdavedj.com/wp-content/uploads/2015/08/sd8.1.jpg'), filename: 'wedding4.jpg', content_type: 'image/jpg')
musickorea.save!

fpro = Product.new(
  name: "DJ Bridal - Special wedding event on SALE",
  price: Faker::Commerce.price,
  description: "Need a DJ for your wedding reception? Serving Seoul, Ilsan, and Incheon area since the year 2000, DJ Bridal has specialized in weddings.",
  category: "Music & Entertainment",
  vendor_id: 7
)
puts "Yujin okay"

fpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/182/141/man-in-black-jacket-standing-in-front-of-dj-mixer.jpg'), filename: 'wefdddddsdding21.jpg', content_type: 'image/jpg')
fpro.save!

fpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/1023/307/turned-on-launch-pad.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
fpro.save!

# -------------------
# -------------------
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

gpro = Product.new(
  name: "Boogie Entertainmentt Book one event, book for your friend for FREE event!",
  price: Faker::Commerce.price,
  description: "Boogie Entertainment DJ Service is happy to cater to events of any size. Their main priority is affordability, knowing that talented DJ services do not have to cost an arm and a leg for your wedding day. Offering free consultations, these professionals work with every couple to find their ideal package, providing a tailored quote made just for you.",
  category: "Music & Entertainment",
  vendor_id: 8
)
puts "Yujin okay"

gpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/641/642/man-and-woman-playing-music-instruments.jpg'), filename: 'wefdddddsdding21.jpg', content_type: 'image/jpg')
gpro.save!

gpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/386/481/selective-focus-photography-of-black-and-silver-xona-headphones-and-terminal-mixer.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
gpro.save!

# -------------------
# -------------------
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

hpro = Product.new(
  name: "Featuring the Fluff Bride Artistry Team for Beauty",
    category: "Bridal Salon",
  price: Faker::Commerce.price,
  description: "For parties of 6+, our private beauty suite is reserved during your services. Our bridal and event hair and makeup services are all-inclusive, easy to book, and always include airbrush foundation and eyelashes.",
  vendor_id: 9
)
puts "Yujin okay"

hpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/446/56/woman-putting-makeup-on-another-woman-s-face.jpg'), filename: 'wefddssags1.jpg', content_type: 'image/jpg')
hpro.save!

hpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/454/944/woman-holding-makeup-brush-in-front-of-mirror.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
hpro.save!

# -------------------
# -------------------
salute = Vendor.new(
  email: "hello@salute.co.kr",
  name: "Salute hair salon",
  password: "123123",
  category: "Bridal Salon",
  phone_number: "01034530030",
  description: "Excellent reputation for stylish, trendy cuts for bridal parties since 2002.",
  address: "130-9, 83 Dongmak-ro, Sangsu-dong, Mapo-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "salute created"

salute.photo.attach(io:URI.open('https://www.miramira-hairandbeauty.co.uk/wp-content/uploads/2016/11/wedding.png'), filename: 'weddving1.png', content_type: 'image/png')
salute.save!

ipro = Product.new(
  name: "Beauty Group Bookings, Hair Stylists, Hair Trials Available",
    category: "Bridal Salon",
  price: Faker::Commerce.price,
  description: "Owner Kong has 18 years of experience in the business, and she and her team will make sure that your dream wedding become a reality.",
  vendor_id: 10
)
puts "Yujin okay"

ipro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/938/565/makeup-palette-on-table.jpg'), filename: 'wefddhhhhh21.jpg', content_type: 'image/jpg')
ipro.save!

ipro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/944/885/woman-in-white-floral-dress-with-white-and-black-floral-headband.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
ipro.save!

# -------------------
# -------------------
sweetiri = Vendor.new(
  email: "hello33@sweetiri.co.kr",
  name: "Sweet Iri Cakes",
  password: "123123",
  category: "Wedding Cakes",
  phone_number: "01034321245",
  description: "Sweet Iri Cakes is known for our incredibly unique dessert tables, cupcake towers, and custom cake/cupcake designs. We spend quality time with our clients to make sure that you get the custom design of your dreams.",
  address: "34-4 Hosu-ro 856beon-gil, Daehwa-dong, Ilsanseo-gu, Goyang-si, Gyeonggi-do, Republic of Korea",
  city: "Seoul"
)
puts "sweetiri created"

sweetiri.photo.attach(io:URI.open('https://www.kellylou.com/wp3/wp-content/uploads/2016/06/ballymagarvey09.05.jpg'), filename: 'wvding1.jpg', content_type: 'image/jpg')
sweetiri.save!

jpro = Product.new(
  name: "Up to five layers with filling, Buttercream cakes on sale",
  price: Faker::Commerce.price,
    category: "Wedding Cakes",
  description: "Husband and wife team that bakes, decorates and assists you every step of the way. We have over 20 delicious flavors, free delivery and free tastings. We are available 7 days a week to better assist you. Currently we cater to traditional appetites as well as vegan, gluten free and any other allergy restrictions!",
  vendor_id: 11
)
puts "Yujin okay"

jpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/845/16/white-icing-coated-3-tier-cake.jpg'), filename: 'dsf1.jpg', content_type: 'image/jpg')
jpro.save!

jpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/499/314/red-and-pink-roses-accent-cake-closeup-photo.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
jpro.save!

# -------------------
# -------------------
parisbaguetto = Vendor.new(
  email: "hello@parisbaguetto.co.kr",
  name: "Paris Baguetto",
  password: "123123",
  category: "Wedding Cakes",
  phone_number: "01089645678",
  description: "Paris Baguetto has been around for over 8 years and we create over 2000 Wedding Cakes every year. We also have 600 square foot dedicated consultation area special for you to create the wedding cake of your dreams!",
  address: "Yeonhui-dong, 132-51 2F, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "parisbaguetto created"

parisbaguetto.photo.attach(io:URI.open('http://www.kellylou.com/wp3/wp-content/uploads/2016/06/2016-04-23-18.04.56-3.jpg'), filename: 'weddidng1.jpg', content_type: 'image/jpg')
parisbaguetto.save!

kpro = Product.new(
  name: "Floral decorated cakes",
  price: Faker::Commerce.price,
    category: "Wedding Cakes",
  description: "With our beautiful custom designed cakes and outstanding flavors, we would like to make your Wedding day an unforgettable event! Floral Decorations are our specialty!",
  vendor_id: 12
)
puts "Yujin okay"

kpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/659/658/untitled.jpg'), filename: 'wtttttt.jpg', content_type: 'image/jpg')
kpro.save!

kpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/788/314/pink-and-white-floral-cake.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
kpro.save!

# -------------------
# -------------------
honeybee = Vendor.new(
  email: "hello@honeybee.co.kr",
  name: "honeybee",
  password: "123123",
  category: "Honeymoon Package",
  phone_number: "01056345633",
  description: "Once in a Lifetime Experience. Come checkout our amazing honeymoon packages! Contact us Now!",
  address: "130-9, ChungDam-dong, GangNam-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "honeybee created"

honeybee.photo.attach(io:URI.open('https://www.zowed.com/blog/wp-content/uploads/2019/01/honeymoon-destinations.jpg'), filename: 'wedddsing1.jpg', content_type: 'image/jpg')
honeybee.save!

lpro = Product.new(
  name: "Goa Honeymoon Packages",
  price: Faker::Commerce.price,
    category: "Honeymoon Package",
  description: "This 3-day Goa holiday has tons in store for you and your partner. A stay in the luxurious five-star hotel The Leela Goa promises an experience of the finer things of life. With many attractions to explore, the promise of a memorable trip stands firm. The scenic setting of the sandy white beaches and the turquoise waters sure is a mesmerizing sight to behold. An exclusive candlelit dinner will make you fall in love all over.",
  vendor_id: 13
)
puts "Yujin okay"

lpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/215/258/rose-petals-on-floor-and-bathtub.jpg'), filename: 'weaaas1.jpg', content_type: 'image/jpg')
lpro.save!

lpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/420/55/wine-bottle-beside-wine-glass-on-table.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
lpro.save!
# -------------------
# -------------------
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

mpro = Product.new(
  name: "Kerala Honeymoon Packages",
  price: Faker::Commerce.price,
    category: "Honeymoon Package",
  description: "Unwind under a palm tree, walk hand in hand with your partner or see a beautiful sunrise on this couples special holiday in Kerala. Your vacation will begin as you reach Cochin and embark on a drive to Munnar. ",
  vendor_id: 14
)
puts "Yujin okay"

mpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/606/902/panoramic-photography-of-resort-near-mountain.jpg'), filename: 'wefsdfsfsddd.jpg', content_type: 'image/jpg')
mpro.save!

mpro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/207/777/in-ground-pool-surrounded-by-trees-during-daytime.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
mpro.save!
# -------------------
# -------------------

matan = Vendor.new(
  email: "hello@matan.co.kr",
  name: "Matan's Steakhouse",
  password: "123123",
  category: "Catering",
  phone_number: "01067443452",
  description: "Large or small, We're happy to cater your event.",
  address: "48 Usadan-ro 14-gil, Yongsan-gu, Seoul, Republic of Korea",
  city: "Seoul"
)
puts "matan created"

matan.photo.attach(io:URI.open('https://www.moneycrashers.com/wp-content/uploads/2019/03/cheap-wedding-reception-food-drink-menu-1068x713.jpg'), filename: 'wedding21.jpg', content_type: 'image/jpg')
matan.save!

npro = Product.new(
  name: "Steak and Desert Package Deal!",
    category: "Catering",
  price: Faker::Commerce.price,
  description: "Matan offers a personalized approach to gourmet catering from casual lunches to elegant sit-down meals in one of our 5 unique venues. We're here to help you from start to finish to ensure your special day is nothing but perfect and that your menu reflects your unique sense of style.",
  vendor_id: 15
)
puts "Yujin okay"

npro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/561/8/steak-with-wasabi.jpg'), filename: 'wmatan.jpg', content_type: 'image/jpg')
npro.save!

npro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/421/771/dessert-table-for-a-party.jpg'), filename: 'wefddssssg21.jpg', content_type: 'image/jpg')
npro.save!

# -------------------
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

opro = Product.new(
  name: "Tacos and Tequila Deal!!",
    category: "Catering",
  price: Faker::Commerce.price,
  description: "A classic. Choose 2 of our freshly grilled meats to start (Carne Asada, Pollo Asado, Al Pastor, Carnitas). Then of course, all the toppings: pico de gallo, verde salsa (medium), roja salsa (hot), shredded lettuce, cheddar and jack cheese blend, diced onions, cilantro, limes, sour cream. Plus.. TEQUILA!",
  vendor_id: 16
)
puts "Yujin okay"

opro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/1005/599/vegetable-salad-on-white-ceramic-plate.jpg'), filename: 'wmavvvtan.jpg', content_type: 'image/jpg')
opro.save!

opro.photos.attach(io:URI.open('https://p0.pikrepo.com/preview/391/88/brown-bread-on-white-and-red-ceramic-plate.jpg'), filename: 'wefddshhhhhsssg21.jpg', content_type: 'image/jpg')
opro.save!

#------------------------------------------------ product's seed --------------------------------------------------------------------
















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
