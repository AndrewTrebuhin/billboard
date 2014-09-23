FactoryGirl.define do
  factory :board do
    description { Faker::Lorem.paragraph(5) }
    association(:user)
  end
end