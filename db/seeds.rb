# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
nicole = User.create!(name: "Nicole", email: "nicole@gmail.com", password: "12345678")

kelly = User.create!(name: "Kelly", email: "kelly@gmail.com", password: "12345678")

duke = User.create!(name: "Duke", email: "duke@gmail.com", password: "12345678")


Post.create!(title: Faker::Lorem.word, body: Faker::Hipster.paragraph, user_id: nicole.id)

Post.create!(title: Faker::Lorem.word, body: Faker::Hipster.paragraph, user_id: nicole.id)

Post.create!(title: Faker::Lorem.word, body: Faker::Hipster.paragraph, user_id: kelly.id)

Post.create!(title: Faker::Lorem.word, body: Faker::Hipster.paragraph, user_id: duke.id)

Post.create!(title: Faker::Lorem.word, body: Faker::Hipster.paragraph, user_id: duke.id)

