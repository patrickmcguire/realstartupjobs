class AddCrunchbaseToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :crunchbase, :boolean
  end
end
