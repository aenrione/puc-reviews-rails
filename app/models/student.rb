class Student < ApplicationRecord
  has_many :teacher_reviews, dependent: :nullify
  has_many :course_reviews, dependent: :nullify
end

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
