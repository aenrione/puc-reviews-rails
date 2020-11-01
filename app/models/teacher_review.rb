class TeacherReview < ApplicationRecord
  belongs_to :teacher
  belongs_to :course
  belongs_to :user, optional: true
  belongs_to :student
  validates :teacher_id, :general_comment, :course_id,
            presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 7 }, presence: true
  attribute :anonymous, :boolean, default: false
  validate :one_review_per_student

  def one_review_per_student
    if TeacherReview.find_by(
      student_id: student_id,
      course_id: course_id,
      teacher_id: teacher_id
    ).present?
      errors.add(:teacher_id, "Ya a escrito sobre este ramo")
    end
  end
end

# == Schema Information
#
# Table name: teacher_reviews
#
#  id               :bigint(8)        not null, primary key
#  rating           :decimal(3, 2)
#  general_comment  :text
#  positive_comment :text
#  negative_comment :text
#  course_id        :bigint(8)        not null
#  teacher_id       :bigint(8)        not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#  student_id       :bigint(8)
#  anonymous        :boolean
#
# Indexes
#
#  index_teacher_reviews_on_course_id   (course_id)
#  index_teacher_reviews_on_student_id  (student_id)
#  index_teacher_reviews_on_teacher_id  (teacher_id)
#  index_teacher_reviews_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (teacher_id => teachers.id)
#
