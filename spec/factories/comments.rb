# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    title { Faker::Lorem.words(2) }
    body  { Faker::Lorem.sentence }
  end
end
