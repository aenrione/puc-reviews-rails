class CreateTeacherCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_courses do |t|
      t.references :teacher, foreign_key: true, null: false
      t.references :course, foreign_key: true, null: false

      t.timestamps
    end
  end
end
