class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :company_id
      t.text :title
      t.text :url
      t.boolean :technical
      t.boolean :type

      t.timestamps
    end
  end
end
