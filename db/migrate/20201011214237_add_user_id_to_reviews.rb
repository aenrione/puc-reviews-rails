class AddUserIdToReviews < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :teacher_reviews, :user, index: {algorithm: :concurrently}

    add_reference :course_reviews, :user, index: {algorithm: :concurrently}
  end
end
