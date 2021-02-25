# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
JoinedActivity.destroy_all
Message.destroy_all
Activity.destroy_all
User.destroy_all
Category.destroy_all

users = User.create!([{username: "martin", email: "martin@gmail.com", password: "123456", birthdate: (Date.today - 20.years), age: 20, gender: "male", language: "french"},
  {username: "emile", email: "emile@gmail.com", password:"123456", birthdate: (Date.today - 20.years), age: 20, gender: "male", language: "french"},
  {username: "seb", email: "seb@gmail.com", password:"123456", birthdate: (Date.today - 20.years), age: 20, gender: "male", language: "french"},
  {username: "arthur", email: "arthur@gmail.com", password:"123456", birthdate: (Date.today - 20.years), age: 20, gender: "male", language: "french"},
  {username: "alex", email: "alex@gmail.com", password:"123456", birthdate: (Date.today - 20.years), age: 20, gender: "male", language: "english"}])

categories = Category.create!([{name: "sport"}, {name: "cultural"}, {name: "drink"}, {name: "restaurant"}, {name: "culunary"}, {name: "mechanical"}, {name: "manual"}, {name: "non-classified"}])
activities = Activity.create!([{name: "yoga", location: "bois de la Cambre", date: Date.today, description: "1 hour", user: users.first, category: categories.first, age: "", gender: "", language: ""}, {name: "climbing", location: "la petite île", date: Date.today, description: "blabla", user: users.last, category: categories.last, age: "", gender: "", language: ""}])
joined_activities = JoinedActivity.create!([{status: "Pending", user: users.first, activity: activities.first},
  {status: "Accepted", user: users.first, activity: activities.last},
{status: "Rejected", user: users[2], activity: activities.first}])
messages = Message.create!(content: "Can I bring my dog?", user: users.first, activity: activities.first)

