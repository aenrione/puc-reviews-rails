class CreateCourseCurrentQuota < ActiveRecord::Migration[6.0]
  def change
    create_table :course_current_quota do |t|
			t.integer :quota
			t.date :last_check
			t.references :semester_course, foreign_key: true, null: false
      t.timestamps
    end
  end
end
