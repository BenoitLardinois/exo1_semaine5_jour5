# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'

#REST ALL THE DATA INTO THE DB
User.destroy_all
City.destroy_all
Accommodation.destroy_all
Reservation.destroy_all

#Création de 20 users
20.times do |index|
  user = User.new
  user.id = index + 1
  user.email = Faker::Internet.email
  user.phone_number = "0755129432"
  user.description = Faker::Hacker.say_something_smart
  user.save
end
puts "20 utilisateurs ont été crées"
tp User.all, :email, :phone_number, :description
  
puts "/n"
puts "/n"

#création de 10 villes
10.times do |index|
  city = City.new
  city.id = index + 1
  city.name = Faker::Address.city
  city.zip_code = Faker::PhoneNumber.subscriber_number(length: 5)
  city.save
end
puts "10 villes ont été créés"
tp City.all, :name, :zip_code
  
#création de 50 logements
50.times do |index|
  accommodation = Accommodation.new
  accommodation.id = index + 1
  accommodation.available_beds = Faker::Number.between(from: 0, to: 10)
  accommodation.price = Faker::Number.between(from: 0, to: 100)
  accommodation.description = Faker::Lorem.characters(number: 140)
  accommodation.has_wifi = true
  accommodation.welcome_message = "Bienvenue dans votre logement AirBnB! Enjoy!"
  accommodation.save
end
puts "50 logements ont été créés"
tp Accommodation.all, :available_beds, :price, :description, :has_wifi, :welcome_mssage







  
  