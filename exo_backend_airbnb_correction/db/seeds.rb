# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'

#supprimer les bases de données précédentes
User.destroy_all
City.destroy_all
Accommodation.destroy_all
Reservation.destroy_all

#créer 20 users
20.times do |index|
  user = User.new
  user.id = index + 1
  user.email = Faker::Internet.email
  user.phone_number = "0755129432"
  user.desciption = Faker::Hacker.say_something_smart
  user.save
end
puts "20 utilisateurs ont été crées"
tp User.all, :id, :email, :phone_number, :desciption

puts "\n"
puts "\n"

#Créer 10 villes
10.times do |index|
  c = City.new
  c.id = index + 1
  c.name = Faker::Address.city
  c.zip_code = Faker::PhoneNumber.subscriber_number(length: 5)
  c.save
end
puts "10 villes on été créées!"
tp City.all, :id, :name, :zip_code

puts "\n"
puts "\n"

#Création de 50 logements
50.times do |index|
  a = Accommodation.new
  a.id = index + 1
  a.available_beds = rand(1..8)
  a.price = rand(30..100)
  a.description = Faker::Lorem.paragraph_by_chars(number: 145)
  a.has_wifi = [true, false].sample
  a.welcome_message = "Bonjour, bienvenue dans ton logement morray!"
  a.city = City.all[rand(0..(City.all.length - 1))]
  a.administrator = User.all[rand(0..(User.all.length - 1))]
  a.save
end
puts "50 logements ont été créés"
tp Accommodation.all, :id, :available_beds, :price, :has_wifi, :administrator_id, :city_id

puts "\n"
puts "\n"

#Créer 10 réservation
10.times do |index|
  r = Reservation.new
  r.id = index + 1
  r.start_date = Faker::Date.between(from: Date.today, to: 364.day.from_now)
  r.end_date = Faker::Date.between(from: (r.start_date + 1.day), to: 365.day.from_now)
  r.accommodation = Accommodation.all[rand(0..(Accommodation.all.length - 1))]
  r.guest = User.all[rand(0..(User.all.length - 1))]
  while r.guest == r.accommodation.administrator
    r.guest = User.all[rand(0..(User.all.length - 1))]
  end
  until r.is_not_overlaping
    r.start_date = Faker::Date.between(from: Date.today, to: 364.day.from_now)
    r.end_date = Faker::Date.between(from: (r.start_date + 1.day), to: 365.day.from_now)
  end
  r.save
end
puts "10 Réservation ont été créés"
tp Reservation.all, :id, :start_date, :end_date, :accommodation_id, :guest_id

puts "\n"
puts "\n"

#Prendre un user au hasard, afficher son mail, ses logements et son numéro de tél
my_user = User.all.sample
puts "Voici la liste des logements proposés par \"#{my_user.email}\" :"
my_user_properties = my_user.owned_accommodations
my_user_properties.each do |a|
  puts "   -#{a.available_beds} couchage(s) à #{a.city.name} (#{a.city.zip_code}), pour #{a.price}€/nuit"
end
puts "Vous pouvez le(la) contacter au: #{my_user.phone_number}"






































