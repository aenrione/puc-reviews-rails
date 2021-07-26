class CreateSemesterCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :semester_courses do |t|
			t.integer :nrc, null: false
			t.string :acronym, null: false
			t.integer :total_quota
			t.string :format
			t.string :category
			t.integer :year, null: false
			t.integer :semester, null: false
			t.references :course, foreign_key: true, null: false
      t.timestamps
    end
  end
end
