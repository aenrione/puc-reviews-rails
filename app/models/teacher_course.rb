class TeacherCourse < ApplicationRecord
  belongs_to :teacher
  belongs_to :course
  validates :teacher_id, :course_id, presence: true
  validate :already_exists

  private

  def already_exists
    if TeacherCourse.find_by(teacher_id: teacher_id, course_id: course_id,
                             semester: semester, year: year).present?
      errors.add(:teacher_id, "Ya existe esta relación")
    end
  end
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
#  year       :integer
#  semester   :integer
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
