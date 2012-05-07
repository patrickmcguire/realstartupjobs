class AddOverviewToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :overview, :text
  end
end
