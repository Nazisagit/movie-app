FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    year { 2000 }
    filming_locations do
      [association(:filming_location)]
    end
  end
end
