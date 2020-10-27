class Faculty < ApplicationRecord
  validates :name, presence: true
  has_many :school_faculties, dependent: :destroy
  has_many :schools, through: :school_faculties
  has_many :courses, through: :schools
  has_many :teachers, through: :courses
end

# == Schema Information
#
# Table name: faculties
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
