require 'faker'
require "open-uri"
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

delphine = User.create!(email: "delphine@gmail.com", password: "delphine", first_name: "delphine", last_name: "cph", description: "blabla", admin: true)
mathieu = User.create!(email: "mathieu@gmail.com", password: "mathieu", first_name: "mathieu", last_name: "Rmn", description: "blabla", admin: true)

puts 'create 8 loutres'

CATEGORY = ["chasse", "garde d'enfant", "boxe", "balade", "voyage"]
PERSONALITY = ["joyeuse", "ronchon", "triste", "jalouse"]
address = ["14 rue Crespin du Gast 75011 Paris", "106 rue vieille du temple 75003 Paris", "16 villa Gaudelet 75011 Paris", "16 place république 75010 Paris "]

file1 = URI.open('https://cdn.futura-sciences.com/buildsv6/images/wide1920/1/3/2/1324ea1666_50171723_loutre-pas-si-betes.jpg')
loutre = Loutre.new(
  name: Faker::Creature::Cat.name,
  price: rand(50..100),
  event: CATEGORY.sample,
  personality: PERSONALITY.sample,
  user: delphine,
  address: address.sample
)
loutre.photo.attach(io: file1, filename: 'loutre1.png', content_type: 'image/png')
loutre.save!

file2 = URI.open('https://cdn.pixabay.com/photo/2013/03/04/17/44/riesen-90026_1280.jpg')
loutre = Loutre.new(
  name: Faker::Creature::Cat.name,
  price: rand(50..100),
  event: CATEGORY.sample,
  personality: PERSONALITY.sample,
  user: delphine,
  address: address.sample
)
loutre.photo.attach(io: file2, filename: 'loutre2.png', content_type: 'image/png')
loutre.save!

file3 = URI.open('https://cdn.pixabay.com/photo/2019/07/24/13/25/otter-4360147_1280.jpg')
loutre = Loutre.new(
  name: Faker::Creature::Cat.name,
  price: rand(50..100),
  event: CATEGORY.sample,
  personality: PERSONALITY.sample,
  user: delphine,
  address: address.sample
)
loutre.photo.attach(io: file3, filename: 'loutre3.png', content_type: 'image/png')
loutre.save!

file4 = URI.open('https://cdn.pixabay.com/photo/2013/03/04/17/37/otter-90025_1280.jpg')
loutre = Loutre.new(
  name: Faker::Creature::Cat.name,
  price: rand(50..100),
  event: CATEGORY.sample,
  personality: PERSONALITY.sample,
  user: delphine,
  address: address.sample
)
loutre.photo.attach(io: file4, filename: 'loutre4.png', content_type: 'image/png')
loutre.save!

file5 = URI.open('https://cdn.pixabay.com/photo/2014/06/09/12/30/otter-365371_1280.jpg')
loutre = Loutre.new(
  name: Faker::Creature::Cat.name,
  price: rand(50..100),
  event: CATEGORY.sample,
  personality: PERSONALITY.sample,
  user: mathieu,
  address: address.sample
)
loutre.photo.attach(io: file5, filename: 'loutre5.png', content_type: 'image/png')
loutre.save!

file6 = URI.open('https://cdn.radiofrance.fr/s3/cruiser-production/2020/06/0209ba70-c605-45f0-a17d-2ad1d2158a53/1136_gettyimages-1169062365.jpg')
loutre = Loutre.new(
  name: Faker::Creature::Cat.name,
  price: rand(50..100),
  event: CATEGORY.sample,
  personality: PERSONALITY.sample,
  user: mathieu,
  address: address.sample
)
loutre.photo.attach(io: file6, filename: 'loutre6.png', content_type: 'image/png')
loutre.save!

file7 = URI.open('https://www.letelegramme.fr/ar/imgproxy.php/images/2021/05/10/la-loutre-d-europe-a-presque-disparu-en-bretagne-elle_5668634_1000x526.jpg?article=20210510-1012748023&aaaammjj=20210510')
loutre = Loutre.new(
  name: Faker::Creature::Cat.name,
  price: rand(50..100),
  event: CATEGORY.sample,
  personality: PERSONALITY.sample,
  user: mathieu,
  address: address.sample
)
loutre.photo.attach(io: file7, filename: 'loutre7.png', content_type: 'image/png')
loutre.save!

file8 = URI.open('https://static.lpnt.fr/images/2018/12/21/17792283lpw-17792282-article-jpg_5825528_1250x625.jpg')
loutre = Loutre.new(
  name: Faker::Creature::Cat.name,
  price: rand(50..100),
  event: CATEGORY.sample,
  personality: PERSONALITY.sample,
  user: mathieu,
  address: address.sample
)
loutre.photo.attach(io: file8, filename: 'loutre8.png', content_type: 'image/png')
loutre.save!

puts 'create 5 locations'

3.times do
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
