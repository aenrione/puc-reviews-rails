class CourseReview < ApplicationRecord
	belongs_to :course
	belongs_to :user, optional: true
	belongs_to :student
	validates :general_comment, :course_id, presence: true
	validates :rating, numericality: { greater_than_or_equal_to: 0,
																			less_than_or_equal_to: 7 }, presence: true
	validate :one_review_per_student
	attribute :anonymous, :boolean, default: false

	def one_review_per_student
		if CourseReview.find_by(student_id: student_id, course_id: course_id).present?
			errors.add(:teacher_id, "Ya a escrito sobre este ramo")
		end
	end
end

# == Schema Information
#
# Table name: course_reviews
#
#  id               :bigint(8)        not null, primary key
#  rating           :decimal(3, 2)
#  general_comment  :text
#  positive_comment :text
#  negative_comment :text
#  course_id        :bigint(8)        not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#  student_id       :bigint(8)
#  anonymous        :boolean
#
# Indexes
#
#  index_course_reviews_on_course_id   (course_id)
#  index_course_reviews_on_student_id  (student_id)
#  index_course_reviews_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
