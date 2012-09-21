class CreateScrapers < ActiveRecord::Migration
  def change
    create_table :scrapers do |t|
      t.string :title
      t.integer :company_id
      t.string :title
      t.string :url
      t.datetime :last_checked
      t.text :description
      t.string :experience_required
      t.string :date_pos

      t.timestamps
    end
  end
end
