# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(:name => :admin)
Role.create(:name => :moderator)
Role.create(:name => :user)

5.times do |i|
  User.create( full_name: Faker::Name.name,
               login: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password: Faker::Internet.password,
               zip: Faker::Address.zip,
               country: Faker::Address.country,
               state: Faker::Address.state,
               city: Faker::Address.city,
               address: Faker::Address.street_address,
               birthday: '22/04/1991' )
end