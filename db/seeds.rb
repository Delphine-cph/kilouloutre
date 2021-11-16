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

10.times do
  loutre = Loutre.new(
    name: Faker::Creature::Cat.name,
    image: 'https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F05.2F06.2F4943b0de-9d2b-46e1-b19b-b3a24407bc8f.2Ejpeg/1150x647/background-color/ffffff/focus-point/960%2C646/quality/70/des-scientifiques-tentent-de-decouvrir-pourquoi-les-loutres-jonglent-avec-des-pierres.jpg',
    price: rand(50..100),
    event: CATEGORY.sample,
    personality: PERSONALITY.sample,
    user: delphine
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
