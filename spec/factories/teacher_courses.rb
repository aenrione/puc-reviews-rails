FactoryBot.define do
  factory :teacher_course do
    association :course
    association :teacher
  end
end
