# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
User.destroy_all

user1 = User.create!(
  email: "user1@example.com",
  password: "qwerty",
  location: "Paris"
)

user2 = User.create!(
  email: "user2@example.com",
  password: "qwerty",
  location: "Lyon"
)

user3 = User.create!(
  email: "user3@example.com",
  password: "qwerty",
  location: "Marseille"
)


pet1 = Pet.create(
  name: "pet1",
  species: "cat",
  bio: "bio cat",
  age: 3,
  price: 30,
  owner: user1
)

pet2 = Pet.create(
  name: "pet2",
  species: "cat",
  bio: "bio cat",
  age: 3,
  price: 30,
  owner: user1
)

pet3 = Pet.create(
  name: "pet3",
  species: "cat",
  bio: "bio cat",
  age: 3,
  price: 30,
  owner: user2
)

pet4 = Pet.create(
  name: "pet4",
  species: "cat",
  bio: "bio cat",
  age: 3,
  price: 30,
  owner: user2
)

pet5 = Pet.create(
  name: "pet5",
  species: "cat",
  bio: "bio cat",
  age: 3,
  price: 30,
  owner: user3
)
