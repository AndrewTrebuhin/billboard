FactoryGirl.define do
  factory :board do
    description { Faker::Lorem.paragraph(5) }

    factory :board_with_new_user do
      association(:user)
    end
  end
end