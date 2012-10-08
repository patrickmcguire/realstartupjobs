class CreateSkillTags < ActiveRecord::Migration
  def change
    create_table :skill_tags do |t|
      t.string :name
      t.text :description
      t.integer :angel_tag_id
      t.string :angel_tag_url
      t.integer :crunchbase_tag_id
      t.string :crunchbase_tag_url
      t.boolean :is_technical

      t.timestamps
    end
  end
end
