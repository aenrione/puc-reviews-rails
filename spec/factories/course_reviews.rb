FactoryBot.define do
  factory :course_review do
    rating { Faker::Number.between(from: 0, to: 7) }
    general_comment { Faker::Lorem.sentence }

    association :course
    association :student
    association :user
  end
end
