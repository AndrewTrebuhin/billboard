FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    login     { Faker::Internet.user_name }
    password  { Faker::Internet.password }
    full_name { Faker::Name.name }
    birthday  { Date.today - Faker::Number.number(3).to_i.days }
    zip       { Faker::Address.zip }
    country   { Faker::Address.country }
    state     { Faker::Address.state }
    city      { Faker::Address.city }
    address   { Faker::Address.street_address }
  end
end