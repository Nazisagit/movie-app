FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    year { 2000 }
    avg_rating { 0 }
  end
end
