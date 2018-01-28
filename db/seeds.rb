require 'faker'

Diner.destroy_all
Group.destroy_all
DinersGroup.delete_all

group_a = Group.create(letter: 'A')
group_b = Group.create(letter: 'B')
group_c = Group.create(letter: 'C')

groups = [group_a, group_b, group_c]

10.times do
  diner = Diner.create(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    start_year: rand(1998...2018)
  )
  groups.sample.diners << diner
end


# create_table :diners do |t|
#   t.string :name
#   t.string :email
#   t.string :phone_number
#   t.string :address
#   t.string :group
#
#   t.timestamps
# end
