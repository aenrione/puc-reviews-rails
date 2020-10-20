class CourseReview < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates :general_comment, :course_id, :user_id, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 7 }, presence: true
end

# == Schema Information
#
# Table name: course_reviews
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
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#
# Indexes
#
#  index_course_reviews_on_course_id  (course_id)
#  index_course_reviews_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
