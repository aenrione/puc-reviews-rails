FactoryBot.define do
  factory :teacher do
    sequence(:id) { |number| number } 
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
  end
end
