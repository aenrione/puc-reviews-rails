FactoryBot.define do
  factory :teacher_review do
    rating { Faker::Number.between(from: 0.0, to: 7.0).round(2) }
    general_comment { Faker::Lorem.sentence }
    association :teacher
    association :course
    association :student
    association :user
  end
end
