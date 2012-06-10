class CreateSavedCompanies < ActiveRecord::Migration
  def change
    create_table :saved_companies do |t|
      t.integer :user_id
      t.integer :company_id
      t.timestamps
    end
  end
end
