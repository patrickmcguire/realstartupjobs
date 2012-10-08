class CreatePressMentions < ActiveRecord::Migration
  def change
    create_table :press_mentions do |t|
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
