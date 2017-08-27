FactoryGirl.define do
  factory :product do
    title Faker::StarTrek.character
    description Faker::TwinPeaks.quote
    user Faker::StarWars.character

    trait :categories do
      categories
    end
  end
end
