class AddStudentsToReviews < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :teacher_reviews, :student, index: { algorithm: :concurrently }
    add_column :teacher_reviews, :anonymous, :boolean
    add_reference :course_reviews, :student, index: { algorithm: :concurrently }
    add_column :course_reviews, :anonymous, :boolean
    safety_assured do
      remove_column :course_reviews, :semester, :integer
      remove_column :course_reviews, :year, :integer
      remove_column :course_reviews, :recommended, :boolean

      remove_column :teacher_reviews, :semester, :integer
      remove_column :teacher_reviews, :year, :integer
      remove_column :teacher_reviews, :recommended, :boolean
    end
  end
end
