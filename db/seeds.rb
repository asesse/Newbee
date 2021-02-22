# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username: "martin", email: "martin@gmail.com", birthdate: (Date.today - 20.years), age: 20, gender: "male", language: "french"}, {username: "emile", email: "emile@gmail.com", birthdate: (Date.today - 20.years), age: 20, gender: "male", language: "french"}])
activities = Activity.create([{name: "yoga", location: "bois de la Cambre", date: Date.today, description: "1 hour"}, {name: "climbing", location: "la petite île", date: Date.today, description: "blabla"}])
categories = Category.create([{name: "sport"}, {name: "cultural activities"}])
