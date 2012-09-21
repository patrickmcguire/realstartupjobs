class AddApprovedToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :approved, :binary
  end
end
