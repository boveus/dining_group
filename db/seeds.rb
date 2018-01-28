require 'faker'

Diner.destroy_all
Group.destroy_all
DinersGroup.delete_all

20.times do
  diner = Diner.create(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    start_year: rand(1998...2017)
  )
end

5.times do
  diner = Diner.create(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    start_year: 2018
  )
end

Group.create_groups
Group.add_members_to_groups
