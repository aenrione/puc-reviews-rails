FactoryBot.define do
  factory :school do
    sequence(:id) { |number| number } 
    name { Faker::Name.unique.name }
    faculty factory: :faculty
  end
end
