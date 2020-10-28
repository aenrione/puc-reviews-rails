class AddSemesterAndYearToTeacherCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :teacher_courses, :year, :integer
    add_column :teacher_courses, :semester, :integer
  end
end
