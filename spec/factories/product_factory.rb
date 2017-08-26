FactoryGirl.define do
  factory :product do
    title Faker::StarTrek.character
    description Faker::TwinPeaks.quote
    user

    trait :categories do
      categories
    end
  end
end
