class AddBaseModelReferences < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :courses, :teacher, index: {algorithm: :concurrently}

    add_reference :courses, :school, index: {algorithm: :concurrently}

    add_reference :schools, :faculty, index: {algorithm: :concurrently}
  end
end
