class AddFieldsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :equity_min, :float
    add_column :jobs, :equity_max, :float
    add_column :jobs, :equity_cliff, :float
    add_column :jobs, :salary_min, :integer
    add_column :jobs, :salary_max, :integer
  end
end
