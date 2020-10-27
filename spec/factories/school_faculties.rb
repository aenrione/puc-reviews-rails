FactoryBot.define do
  factory :school_faculty do
    association :school
    association :faculty
  end
end
