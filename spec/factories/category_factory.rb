FactoryGirl.define do
  factory :category do
    name Faker::Overwatch.location
    trait :products do
      products
    end
  end
end
