class TeacherReview < ApplicationRecord
  belongs_to :teacher
  belongs_to :course
  belongs_to :user
  validates :teacher_id, :general_comment, :course_id, :user_id,
            presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 7 }, presence: true
end

# == Schema Information
#
# Table name: teacher_reviews
#
#  id               :bigint(8)        not null, primary key
#  rating           :float
#  general_comment  :text
#  positive_comment :text
#  negative_comment :text
#  recommended      :boolean
#  semester         :integer
#  year             :integer
#  course_id        :bigint(8)        not null
#  teacher_id       :bigint(8)        not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#
# Indexes
#
#  index_teacher_reviews_on_course_id   (course_id)
#  index_teacher_reviews_on_teacher_id  (teacher_id)
#  index_teacher_reviews_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (teacher_id => teachers.id)
#
