class AddResumatorFeedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :resumator_feed, :string
    add_column :companies, :jobscore_feed, :string
  end
end
