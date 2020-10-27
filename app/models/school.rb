class School < ApplicationRecord
  has_many :school_faculties, dependent: :destroy
  has_many :faculties, through: :school_faculties
  has_many :courses, dependent: :destroy
  has_many :teachers, through: :courses
  validates :name, presence: true
end

# == Schema Information
#
# Table name: schools
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
