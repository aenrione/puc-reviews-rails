class ChangeRatingToDecimals < ActiveRecord::Migration[6.0]
  def up
    safety_assured do
      change_column :teachers, :global_rating, :decimal, precision: 3, scale: 2
      change_column :courses, :global_rating, :decimal, precision: 3, scale: 2
      change_column :teacher_reviews, :rating, :decimal, precision: 3, scale: 2
      change_column :course_reviews, :rating, :decimal, precision: 3, scale: 2
    end
  end

  def down
    safety_assured do
      change_column :teachers, :global_rating, :float
      change_column :courses, :global_rating, :float
      change_column :teacher_reviews, :rating, :float
      change_column :course_reviews, :rating, :float
    end
  end
end
