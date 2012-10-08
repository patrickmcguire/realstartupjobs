class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|
      t.string :title
      t.text :snippet
      t.string :url
      t.string :source
      t.string :company_id
      t.string :job_id
      t.datetime :updated_at

      t.timestamps
    end
  end
end
