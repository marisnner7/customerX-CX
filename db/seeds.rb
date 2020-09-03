# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database'
Customer.destroy_all
puts 'Customers destroyed'

puts 'Creating Customers'

30.times do
  customer = Customer.new(
    name: Faker::Name.name,
    telephone: Faker::PhoneNumber.cell_phone_in_e164,
    register_day: Faker::Date.in_date_period(month: 2),
    email: Faker::Internet.email,
    password: '12345678'
  )
  customer.save!
end

 puts 'Creating contacts'

Contact.create(name: 'Tamera Batz', emails: 'loise_hermiston@thiel-shields.name', cellphone: "213647558", customer_id: 1)
Contact.create(name: 'Msgr. Clay Russel', emails: 'jessie@renner-larkin.org', cellphone: "1517118", customer_id: 11)
Contact.create(name: 'Amb. Maria Morissette', emails: 'omar.ritchie@mann-renner.name', cellphone: "821464", customer_id: 4)
Contact.create(name: 'Lamar Ratke', emails: 'kieth_leuschke@schroeder.com', cellphone: "434343434", customer_id: 13)
Contact.create(name: 'Cathi Mante', emails: 'randa@simonis.net', cellphone: "4343434342", customer_id: 17)
Contact.create(name: 'Jonas Wiza', emails: 'euschke@schroeder.coma', cellphone: "721424242", customer_id: 11)
Contact.create(name: 'Bart Blockt', emails: 'nicholas@gaylord.biz', cellphone: "75424242", customer_id: 23)
Contact.create(name: 'Arnoldo Schmidt', emails: 'amaris.bergnaum@reichert-kemmer.info', cellphone: "75424242", customer_id: 12)
Contact.create(name: 'Sofia Vo', emails: 'nicholas@gaylord.biz', cellphone: "75424242", customer_id: 15)
Contact.create(name: 'Mrs. Dane Stracke', emails: 'alexis_schmitt@lakin-conn.name', cellphone: "75424242", customer_id: 12)
Contact.create(name: 'Georgeann Kerluke', emails: 'nicholas@gaylord.biz', cellphone: "75424242", customer_id: 13)
Contact.create(name: 'Antwan Mer', emails: 'reyes_herman@kreiger.name', cellphone: "75424242", customer_id: 7)



# 30.times do
#   contact = Contact.new(
#     name: Faker::Name.name,
#     emails: Faker::Internet.free_email,
#     cellphone: Faker::PhoneNumber.cell_phone_with_country_code,
#     customer_id: rand(1..15)
#   )
#   contact.save
#   end 
  

puts 'Finished!'
