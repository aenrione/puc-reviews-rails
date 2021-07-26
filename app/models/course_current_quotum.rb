class CourseCurrentQuotum < ApplicationRecord
	belongs_to :semester_course
end

# == Schema Information
#
# Table name: course_current_quota
#
#  id                 :bigint(8)        not null, primary key
#  quota              :integer
#  last_check         :date
#  semester_course_id :bigint(8)        not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_course_current_quota_on_semester_course_id  (semester_course_id)
#
# Foreign Keys
#
#  fk_rails_...  (semester_course_id => semester_courses.id)
#
