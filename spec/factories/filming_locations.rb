FactoryBot.define do
  factory :filming_location do
    name { Faker::Address.city }
    country { Faker::Address.country }
    trait :for_movie do
      association :filmable, factory: :movie
    end
  end
end
