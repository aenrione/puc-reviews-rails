class RemoveFacultyIdFromSchool < ActiveRecord::Migration[6.0]
  def change
    safety_assured do
      remove_reference :schools, :faculty, index: { algorithm: :concurrently }
    end
  end
end
