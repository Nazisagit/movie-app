FactoryBot.define do
  factory :persona do
    name { Faker::Name.full_name }
  end
end
