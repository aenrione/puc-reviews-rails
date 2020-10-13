class Course < ApplicationRecord
  belongs_to :school
  has_one :faculty, through: :school, dependent: :nullify
  has_many :teacher_courses, dependent: :destroy
  has_many :teachers, through: :teacher_courses
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
#  school_id  :bigint(8)
#
# Indexes
#
#  index_courses_on_school_id  (school_id)
#
