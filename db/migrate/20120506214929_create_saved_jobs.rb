class CreateSavedJobs < ActiveRecord::Migration
  def change
    create_table :saved_jobs do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
