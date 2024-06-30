FactoryBot.define do
  factory :persona do
    name { Faker::Name.name }
  end
end
