# == Schema Information
#
# Table name: course_reviews
#
#  id               :bigint(8)        not null, primary key
#  rating           :float
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
module CourseReviewsHelper
end
