class AddHiringToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :hiring, :boolean
  end
end
