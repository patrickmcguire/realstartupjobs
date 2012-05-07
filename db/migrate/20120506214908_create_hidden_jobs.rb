class CreateHiddenJobs < ActiveRecord::Migration
  def change
    create_table :hidden_jobs do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
