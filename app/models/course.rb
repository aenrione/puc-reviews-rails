class Course < ApplicationRecord
  belongs_to :teacher
  belongs_to :school
  has_one :faculty, through: :school, dependent: :nullify
  validates :name, :credits, :acronym, :campus, :school_id, :teacher_id, presence: true
end

# == Schema Information
#
# Table name: courses
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  credits    :integer
#  acronym    :string
#  campus     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :bigint(8)
#  school_id  :bigint(8)
#
# Indexes
#
#  index_courses_on_school_id   (school_id)
#  index_courses_on_teacher_id  (teacher_id)
#
