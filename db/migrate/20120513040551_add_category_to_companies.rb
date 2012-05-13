class AddCategoryToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :category, :text
  end
end
