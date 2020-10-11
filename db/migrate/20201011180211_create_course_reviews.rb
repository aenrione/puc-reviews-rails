class CreateCourseReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :course_reviews do |t|
      t.float :rating
      t.text :general_comment
      t.text :positive_comment
      t.text :negative_comment
      t.boolean :recommended
      t.integer :semester
      t.integer :year
      t.references :course, foreign_key: true, null: false


      t.timestamps
    end
  end
end
