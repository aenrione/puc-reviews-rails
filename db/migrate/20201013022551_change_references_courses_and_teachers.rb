class ChangeReferencesCoursesAndTeachers < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      remove_reference :courses, :teacher, index: {algorithm: :concurrently}
    end
  end
end
