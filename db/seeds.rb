# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Pet.destroy_all
User.destroy_all

user1 = User.create!({
  email: Faker::Internet.email,
  password: "qwerty",
  name: Faker::Name.unique.name,
  bio: "I love my pets",
  location: "Lyon part dieu",
  remote_avatar_url: "https://images.unsplash.com/photo-1548535537-3cfaf1fc327c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
})
user2 = User.create!({
  email: Faker::Internet.email,
  password: "qwerty",
  name: Faker::Name.unique.name,
  bio: "Cats and dogs are my life!",
  location: "Paris",
  remote_avatar_url: "https://images.unsplash.com/photo-1554555819-f722cb0c01c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
})
user3 = User.create!({
  email: Faker::Internet.email,
  password: "qwerty",
  name: Faker::Name.unique.name,
  bio: "Love travel and cute animals",
  location: "Lyon 69001",
  remote_avatar_url: "https://images.unsplash.com/photo-1554453433-9af917b6f571?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
})
user4 = User.create!({
  email: Faker::Internet.email,
  password: "qwerty",
  name: Faker::Name.unique.name,
  bio: "Happy to pet sit your adorable pets anytime",
  location: "Paris",
  remote_avatar_url: "https://images.unsplash.com/photo-1542080681-b52d382432af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
})
user5 = User.create!({
  email: Faker::Internet.email,
  password: "qwerty",
  name: Faker::Name.unique.name,
  bio: "Love food, travel, and cats. Dogs are OK too.",
  location: "Villeurbanne",
  remote_avatar_url: "https://images.unsplash.com/photo-1493732839258-ca76fb5d09ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
})
user6 = User.create!({
    email: Faker::Internet.email,
    password: "qwerty",
    name: Faker::Name.unique.name,
    bio: "Full stack web programmer and proud dog owner.",
    location: "Paris barbes",
    remote_avatar_url: "https://images.unsplash.com/photo-1497948408037-3f93f842fc5f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
})

# pets
Pet.create!({
  name: Faker::Creature::Dog.name,
  species: "dog",
  bio: "I am an adorable dog and I like long walks on the beach.",
  age: %w(1 2 3 4 5 6 7 8 9).sample,
  price: "50",
  owner: user1,
  remote_photo_url: "https://images.unsplash.com/photo-1483392707171-cb3e4b1cb8b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
})
Pet.create!({
  name: Faker::Creature::Cat.name,
  species: "cat",
  bio: "I am a playful cat and I like to sleep.",
  age: %w(1 2 3 4 5 6 7 8 9).sample,
  price: "50",
  owner: user1,
  remote_photo_url: "https://images.unsplash.com/photo-1455525928928-837c99714248?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80"
})
Pet.create!({
  name: Faker::Creature::Cat.name,
  species: "dog",
  bio: "I am an adorable dog and I like long walks on the beach.",
  age: %w(1 2 3 4 5 6 7 8 9).sample,
  price: "50",
  owner: user2,
  remote_photo_url: "https://images.unsplash.com/photo-1508609540374-67d1601ba520?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80"
})
Pet.create!({
  name: Faker::Creature::Cat.name,
  species: "cat",
  bio: "I am a playful cat and I like to sleep.",
  age: %w(1 2 3 4 5 6 7 8 9).sample,
  price: "50",
  owner: user3,
  remote_photo_url: "https://images.unsplash.com/photo-1513421181656-4446bef18317?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1001&q=80"
})
Pet.create!({
  name: Faker::Creature::Cat.name,
  species: "dog",
  bio: "I am an adorable dog and I like long walks on the beach.",
  age: %w(1 2 3 4 5 6 7 8 9).sample,
  price: "50",
  owner: user3,
  remote_photo_url: "https://images.unsplash.com/photo-1523626797181-8c5ae80d40c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80"
})
Pet.create!({
  name: Faker::Creature::Cat.name,
  species: "cat",
  bio: "I am a playful cat and I like to sleep.",
  age: %w(1 2 3 4 5 6 7 8 9).sample,
  price: "50",
  owner: user3,
  remote_photo_url: "https://images.unsplash.com/photo-1497473376897-16fbb7552478?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
})
