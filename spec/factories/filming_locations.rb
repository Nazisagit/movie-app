FactoryBot.define do
  factory :filming_location do
    name { Faker::Address.city }
    country { Faker::Address.country }
  end
end
