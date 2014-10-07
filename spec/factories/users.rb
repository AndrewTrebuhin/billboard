FactoryGirl.define do

  factory :user do
    email     { Faker::Internet.email }
    login     { Faker::Internet.user_name }
    password  { Faker::Internet.password }
    full_name { Faker::Name.name }
    birthday  { Date.today - Faker::Number.number(3).to_i.days }
    zip       { Faker::Address.zip_code }
    country   { Faker::Address.country }
    state     { Faker::Address.state }
    city      { Faker::Address.city }
    address   { Faker::Address.street_address }

    factory :user_with_boards do
      after(:create) do |user|
        rand(1..3).times { create(:board, user: user) }
      end
    end
  end
end