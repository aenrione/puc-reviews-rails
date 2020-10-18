FactoryBot.define do
  factory :teacher_review do
    rating { Faker::Number.between(from: 0, to: 7) }
    general_comment { Faker::Lorem.sentence }
    association :teacher
    association :course
    association :user
  end
end
