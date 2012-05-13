class AddCrunchbaseUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :crunchbase_url, :text
  end
end
