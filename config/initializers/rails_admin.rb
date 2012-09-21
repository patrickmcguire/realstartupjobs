# RailsAdmin config file. Generated on September 20, 2012 03:34
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

 config.authenticate_with {}
  # If you want to track changes on your models:
  # config.audit_with :history, AdminUser

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, AdminUser

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Realstartupjobs', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [AdminUser, Company, CompanyTag, HiddenJob, Job, SavedCompany, SavedJob, ScrapedJob, Scraper, Tag, TempCompany, User, UserId]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [AdminUser, Company, CompanyTag, HiddenJob, Job, SavedCompany, SavedJob, ScrapedJob, Scraper, Tag, TempCompany, User, UserId]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model AdminUser do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Company do
  #   # Found associations:
  #     configure :saved_companies, :has_many_association 
  #     configure :jobs, :has_many_association 
  #     configure :company_tags, :has_many_association 
  #     configure :tags, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :text 
  #     configure :url, :text 
  #     configure :funding, :integer 
  #     configure :employees, :integer 
  #     configure :description, :text 
  #     configure :hiring, :string 
  #     configure :jobs_url, :text 
  #     configure :overview, :text 
  #     configure :crunchbase, :boolean 
  #     configure :founded, :text 
  #     configure :twitter_name, :text 
  #     configure :blog_url, :text 
  #     configure :category, :text 
  #     configure :crunchbase_url, :text 
  #     configure :angel_id, :integer 
  #     configure :jobs_page, :text 
  #     configure :stage, :integer 
  #     configure :why_us, :text 
  #     configure :crunchbase_slug, :text 
  #     configure :jobs_page_type, :text 
  #     configure :logo_file_name, :string         # Hidden 
  #     configure :logo_content_type, :string         # Hidden 
  #     configure :logo_file_size, :integer         # Hidden 
  #     configure :logo_updated_at, :datetime         # Hidden 
  #     configure :logo, :paperclip 
  #     configure :resumator_feed, :string 
  #     configure :jobscore_feed, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model CompanyTag do
  #   # Found associations:
  #     configure :company, :belongs_to_association 
  #     configure :tag, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :company_id, :integer         # Hidden 
  #     configure :tag_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model HiddenJob do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer 
  #     configure :job_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Job do
  #   # Found associations:
  #     configure :company, :belongs_to_association 
  #     configure :saved_jobs, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :company_id, :integer         # Hidden 
  #     configure :title, :text 
  #     configure :url, :text 
  #     configure :technical, :boolean 
  #     configure :internship, :boolean 
  #     configure :created_at, :text 
  #     configure :updated_at, :text 
  #     configure :last_updated, :datetime 
  #     configure :date_posted, :date 
  #     configure :description, :text 
  #     configure :last_check, :datetime 
  #     configure :experience_required, :string 
  #     configure :kind, :string 
  #     configure :source, :string 
  #     configure :sorce_unique_id, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model SavedCompany do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :company, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :company_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model SavedJob do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :job, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :job_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model ScrapedJob do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :company_id, :integer 
  #     configure :url, :string 
  #     configure :last_checked, :datetime 
  #     configure :description, :text 
  #     configure :experience_required, :string 
  #     configure :date_posted, :datetime 
  #     configure :source, :string 
  #     configure :source_unique_id, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Scraper do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :company_id, :integer 
  #     configure :url, :string 
  #     configure :last_checked, :datetime 
  #     configure :description, :text 
  #     configure :experience_required, :string 
  #     configure :date_pos, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Tag do
  #   # Found associations:
  #     configure :company_tags, :has_many_association 
  #     configure :tags, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :tag, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model TempCompany do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :company_name, :text 
  #     configure :company_url, :text 
  #     configure :company_hiring, :text 
  #     configure :company_jobs_url, :text 
  #     configure :nocrunchbase, :text 
  #     configure :name, :text 
  #     configure :overview, :text 
  #     configure :homepage_url, :text 
  #     configure :employees, :text 
  #     configure :category, :text 
  #     configure :description, :text 
  #     configure :founded_year, :text 
  #     configure :founded_month, :text 
  #     configure :money_raised, :text 
  #     configure :crunchbase_url, :text 
  #     configure :tag_list, :text 
  #     configure :twitter_name, :text 
  #     configure :blog_url, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #     configure :saved_jobs, :has_many_association 
  #     configure :saved_companies, :has_many_association 
  #     configure :hidden_jobs, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model UserId do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :company_id, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
