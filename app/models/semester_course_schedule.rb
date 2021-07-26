class SemesterCourseSchedule < ApplicationRecord
	belongs_to :semester_course
end

# == Schema Information
#
# Table name: semester_course_schedules
#
#  id                 :bigint(8)        not null, primary key
#  type               :string
#  dates              :string
#  classroom          :string
#  semester_course_id :bigint(8)        not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_semester_course_schedules_on_semester_course_id  (semester_course_id)
#
# Foreign Keys
#
#  fk_rails_...  (semester_course_id => semester_courses.id)
#
