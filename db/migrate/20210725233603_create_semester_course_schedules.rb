class CreateSemesterCourseSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :semester_course_schedules do |t|
			t.string :type
			t.string :dates
			t.string :classroom
			t.references :semester_course, foreign_key: true, null: false
      t.timestamps
    end
  end
end
