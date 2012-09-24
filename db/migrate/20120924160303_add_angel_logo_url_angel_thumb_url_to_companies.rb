class AddAngelLogoUrlAngelThumbUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :angel_logo_url, :string
    add_column :companies, :angel_thumb_url, :string

  end
end
