class Course < ApplicationRecord
	belongs_to :school
	has_many :teacher_courses, dependent: :destroy
	has_many :teachers, through: :teacher_courses
	has_many :course_reviews, dependent: :destroy
	has_many :semester_courses, dependent: :destroy
	validates :name, :credits, :school_id, presence: true
	attribute :global_rating, :float, default: 0

	def autocomplete_name
		"#{acronym} - #{name}"
	end
end

# == Schema Information
#
# Table name: courses
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  credits       :integer
#  acronym       :string
#  campus        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  school_id     :bigint(8)
#  global_rating :decimal(3, 2)
#
# Indexes
#
#  index_courses_on_school_id  (school_id)
#
