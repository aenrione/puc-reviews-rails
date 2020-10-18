FactoryBot.define do
  factory :faculty do
    sequence(:id) { |number| number }
    name { Faker::Name.unique.name }
  end
end
