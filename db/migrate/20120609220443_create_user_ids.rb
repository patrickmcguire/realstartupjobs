class CreateUserIds < ActiveRecord::Migration
  def change
    create_table :user_ids do |t|
      t.string :company_id

      t.timestamps
    end
  end
end
