class AddBlogUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :blog_url, :text
  end
end
