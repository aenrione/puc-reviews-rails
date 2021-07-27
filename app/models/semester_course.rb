class SemesterCourse < ApplicationRecord
	has_many :semester_course_schedules, dependent: :destroy
	has_many :course_current_quotum, dependent: :destroy
	belongs_to :course
end

# == Schema Information
#
# Table name: semester_courses
#
#  id          :bigint(8)        not null, primary key
#  nrc         :integer          not null
#  acronym     :string           not null
#  total_quota :integer
#  format      :string
#  category    :string
#  year        :integer          not null
#  semester    :integer          not null
#  course_id   :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_semester_courses_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
