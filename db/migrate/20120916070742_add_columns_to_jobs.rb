class AddColumnsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :date_posted, :date
    add_column :jobs, :description, :text
    add_column :jobs, :last_check, :datetime
    add_column :jobs, :experience_required, :string
    add_column :jobs, :kind, :string
    add_column :jobs, :source, :string
    add_column :jobs, :sorce_unique_id, :string
  end
end
