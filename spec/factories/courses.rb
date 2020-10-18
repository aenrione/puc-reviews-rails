FactoryBot.define do
  factory :course do
    sequence(:id) { |number| number }
    name { Faker::Name.unique.name }
    credits { Faker::Number.between(from: 0, to: 15) }
    campus { 'campus' }
    school
  end
end
