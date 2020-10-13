class Teacher < ApplicationRecord
  validates :name, presence: true
  attribute :global_rating, :float, default: 0
  has_many :teacher_courses, dependent: :destroy
  has_many :courses, through: :teacher_courses
end

# == Schema Information
#
# Table name: teachers
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  email         :string
#  global_rating :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
