class CreateJobsTags < ActiveRecord::Migration
  def change
    create_table :jobs_tags do |t|
      t.integer :tag_id
      t.integer :job_id

      t.timestamps
    end
  end
end
