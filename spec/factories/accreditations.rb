FactoryBot.define do
  factory :accreditation do
    trait :acting_credit do
      accreditation_type { :actor }
    end

    trait :directing_credit do
      accreditation_type { :director }
    end
  end
end
