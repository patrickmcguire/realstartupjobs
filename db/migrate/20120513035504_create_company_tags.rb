class CreateCompanyTags < ActiveRecord::Migration
  def change
    create_table :company_tags do |t|
      t.integer :company_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
