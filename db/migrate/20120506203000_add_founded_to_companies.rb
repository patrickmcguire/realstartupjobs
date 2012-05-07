class AddFoundedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :founded, :timestamp
  end
end
