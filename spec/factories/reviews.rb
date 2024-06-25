FactoryBot.define do
  factory :review do
    user { nil }
    rating { 1 }
    comment { Faker::Quote.matz }
    trait :for_movie do
      association :reviewable, factory: :movie
    end
  end
end
