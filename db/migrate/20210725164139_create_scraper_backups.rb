class CreateScraperBackups < ActiveRecord::Migration[6.0]
  def change
    create_table :scraper_backups do |t|
      t.integer :year, null: false
      t.integer :semester, null: false
			t.jsonb :json
      t.timestamps
    end
  end
end
