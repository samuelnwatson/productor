FactoryGirl.define do
  factory :user do
    name Faker::StarWars.character
    sequence(:email) { |n| "default#{n}@default.com" }
    password 'password'
  end
end
