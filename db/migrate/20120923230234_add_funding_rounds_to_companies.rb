class AddFundingRoundsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :funding_rounds, :integer
  end
end
