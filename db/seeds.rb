# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database"
Customer.destroy_all
puts "Customers destroyed"

puts "Creating Customers"
  

30.times do
  customer = Customer.new(
    name: Faker::Name.name,
    telephone: Faker::PhoneNumber.cell_phone_in_e164,
    register_day: Faker::Date.in_date_period(month: 2)
  ) 
  customer.save!
end

puts 'Finished!'