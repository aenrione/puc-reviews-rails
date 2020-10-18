class TeacherCourse < ApplicationRecord
  belongs_to :teacher
  belongs_to :course
  validates :teacher_id, :course_id, uniqueness: true, presence: true
  has_one_attached :avatar
end

# == Schema Information
#
# Table name: teacher_courses
#
#  id         :bigint(8)        not null, primary key
#  teacher_id :bigint(8)        not null
#  course_id  :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_teacher_courses_on_course_id   (course_id)
#  index_teacher_courses_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (teacher_id => teachers.id)
#
