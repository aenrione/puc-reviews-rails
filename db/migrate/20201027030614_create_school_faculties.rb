class CreateSchoolFaculties < ActiveRecord::Migration[6.0]
  def change
    create_table :school_faculties do |t|
      t.references :school, foreign_key: true, null: false
      t.references :faculty, foreign_key: true, null: false
      t.timestamps
    end
  end
end
