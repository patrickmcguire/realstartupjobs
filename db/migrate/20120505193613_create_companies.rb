class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :name
      t.text :url
      t.integer :funding
      t.integer :employees

      t.timestamps
    end
  end
end
