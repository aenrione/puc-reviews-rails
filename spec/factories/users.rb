FactoryBot.define do
  factory :user do
    sequence(:id) { |number| number }
    name { Faker::Name.unique.name  }
    student_number { Faker::Number.unique.number(digits: 10) }
    email { Faker::Internet.unique.email }
    password { Faker::Lorem.characters(number: 10) }
  end
end
