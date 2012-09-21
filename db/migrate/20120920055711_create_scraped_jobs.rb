class CreateScrapedJobs < ActiveRecord::Migration
  def change
    create_table :scraped_jobs do |t|
      t.string :title
      t.integer :company_id
      t.string :title
      t.string :url
      t.datetime :last_checked
      t.text :description
      t.string :experience_required
      t.datetime :date_posted
      t.string :source
      t.string :source_unique_id

      t.timestamps
    end
  end
end
