class AddTwitterNameToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :twitter_name, :text
  end
end
