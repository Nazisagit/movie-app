FactoryBot.define do
  factory :user do
    name { Faker::Name.full_name }
  end
end
