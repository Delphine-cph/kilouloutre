require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning db'
Location.destroy_all
Loutre.destroy_all
User.destroy_all

puts 'create 5 users'
5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

delphine = User.create!(email: "delphine@gmail.com", password: "delphine", first_name: "delphine", last_name: "cph", description: "blabla")

puts 'create 10 loutres'

CATEGORY = ["party", "travel", "restaurant"]
PERSONALITY = ["angry", "happy"]

images = ['https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F05.2F06.2F4943b0de-9d2b-46e1-b19b-b3a24407bc8f.2Ejpeg/1150x647/background-color/ffffff/focus-point/960%2C646/quality/70/des-scientifiques-tentent-de-decouvrir-pourquoi-les-loutres-jonglent-avec-des-pierres.jpg',
   'https://cdn.pixabay.com/photo/2013/03/04/17/44/riesen-90026_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/07/24/13/25/otter-4360147_1280.jpg',
    'https://cdn.pixabay.com/photo/2013/03/04/17/37/otter-90025_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/08/22/14/08/asian-short-clawed-otter-4423602__480.jpg',
    'https://cdn.pixabay.com/photo/2014/06/09/12/30/otter-365371_1280.jpg']

address = ["14 rue Crespin du Gast 75011 Paris", "106 rue vieille du temple 75003 Paris", "16 villa Gaudelet 75011 Paris"]

10.times do
  loutre = Loutre.new(
    name: Faker::Creature::Cat.name,
    image: images.sample,
    price: rand(50..100),
    event: CATEGORY.sample,
    personality: PERSONALITY.sample,
    user: delphine,
    address: address.sample
  )
  loutre.save!
end

puts 'create 5 locations'

5.times do
  location = Location.new(
    date_départ: Date.new(2021, 11, 17),
    date_arrive: Date.new(2021, 11, 18),
    status: false,
    user: delphine,
    loutre: Loutre.all.sample
  )
  location.save!
end

puts 'done'
