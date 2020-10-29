class ChangeStudentNumberToString < ActiveRecord::Migration[6.0]
  def change
    safety_assured { remove_column :users, :student_number }
  end
end
