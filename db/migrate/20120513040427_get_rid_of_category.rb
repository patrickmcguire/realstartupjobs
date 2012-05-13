class GetRidOfCategory < ActiveRecord::Migration
  def up
    drop_table(:categories)
  end

  def down
    create_table :categories do |t|
      t.text :categories
      t.timestamps
    end
  end
end
