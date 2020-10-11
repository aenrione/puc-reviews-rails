class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :credits
      t.string :acronym
      t.string :campus

      t.timestamps
    end
  end
end
