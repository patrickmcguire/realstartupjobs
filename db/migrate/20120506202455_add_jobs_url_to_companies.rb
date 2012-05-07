class AddJobsUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :jobs_url, :text
  end
end
