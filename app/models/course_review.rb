class CourseReview < ApplicationRecord
  validates :rating, :general_comment, :course_id, :recommended, presence: true
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
#
# Indexes
#
#  index_course_reviews_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
