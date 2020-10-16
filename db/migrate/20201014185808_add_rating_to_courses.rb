class AddRatingToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :global_rating, :float
  end
end
