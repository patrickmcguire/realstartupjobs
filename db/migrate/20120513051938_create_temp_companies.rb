class CreateTempCompanies < ActiveRecord::Migration
  def change
    create_table :temp_companies do |t|
      t.text :company_name
      t.text :company_url
      t.text :company_hiring
      t.text :company_jobs_url
      t.text :nocrunchbase
      t.text :name
      t.text :overview
      t.text :homepage_url
      t.text :employees
      t.text :category
      t.text :description
      t.text :founded_year
      t.text :founded_month
      t.text :money_raised
      t.text :crunchbase_url
      t.text :tag_list
      t.text :twitter_name
      t.text :blog_url

      t.timestamps
    end
  end
end
