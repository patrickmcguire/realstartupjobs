class AddDescriptionToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :description, :text, :after => :name
  end
end
