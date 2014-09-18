FactoryGirl.define do
  factory :board do
    description { Faker::Lorem.paragraph(2) }
    association(:user)
  end
end