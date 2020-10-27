FactoryBot.define do
  factory :school do
    sequence(:id) { |number| number }
    name { Faker::Name.unique.name }
  end
end
