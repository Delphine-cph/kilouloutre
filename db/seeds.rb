require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning db'
User.destroy_all
Loutre.destroy_all
Location.destroy_all

puts 'create 5 users'
5.times do
  user = User.new (
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email
  )
  user.save!
end

puts 'create 10 loutres'

CATEGORY = ["party", "travel", "restaurant"]
PERSONALITY = ["angry", "happy"]

10.times do
  loutre = Loutre.new(
    name: Faker::Creature::Cat.name,
    image: url('https://images.ladepeche.fr/api/v1/images/view/5c191a488fe56f070e4715d0/large/image.jpg'),
    price: rand(50..100),
    event: CATEGORY.sample,
    personality: PERSONALITY.sample
  )
  loutre.save!
end

puts 'create 5 locations'

5.times do
  location = Location.new(
    date_départ: 17/11/21
    date_arrive: 17/11/21
    status: false
  )
  location.save!
end

puts 'done'
