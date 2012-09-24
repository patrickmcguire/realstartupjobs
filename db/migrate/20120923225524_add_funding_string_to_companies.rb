class AddFundingStringToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :funding_string, :string
  end
end
