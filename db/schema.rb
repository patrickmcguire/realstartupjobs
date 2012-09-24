# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120924160303) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.text     "name"
    t.text     "url"
    t.integer  "funding",           :limit => 8
    t.integer  "employees"
    t.text     "description"
    t.string   "hiring",            :limit => 1
    t.text     "jobs_url"
    t.text     "overview"
    t.boolean  "crunchbase"
    t.text     "founded"
    t.text     "twitter_name"
    t.text     "blog_url"
    t.text     "category"
    t.text     "crunchbase_url"
    t.integer  "angel_id",          :limit => 8
    t.text     "jobs_page"
    t.integer  "stage"
    t.text     "why_us"
    t.text     "crunchbase_slug"
    t.text     "jobs_page_type"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "resumator_feed"
    t.string   "jobscore_feed"
    t.string   "funding_string"
    t.integer  "funding_rounds"
    t.string   "angel_logo_url"
    t.string   "angel_thumb_url"
  end

  create_table "company_tags", :force => true do |t|
    t.integer  "company_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hidden_jobs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs", :force => true do |t|
    t.integer  "company_id"
    t.text     "title"
    t.text     "url"
    t.boolean  "technical"
    t.boolean  "internship"
    t.text     "created_at",                                           :null => false
    t.text     "updated_at",                                           :null => false
    t.datetime "last_updated"
    t.date     "date_posted"
    t.text     "description"
    t.datetime "last_checked"
    t.string   "experience_required"
    t.string   "kind"
    t.string   "source"
    t.string   "source_unique_id"
    t.string   "approved",                          :default => false
    t.string   "equity_min"
    t.string   "equity_max",          :limit => 25
    t.string   "equity_cliff"
    t.string   "salary_min"
    t.string   "salary_max"
  end

  create_table "jobs2", :id => false, :force => true do |t|
    t.string "jid",        :limit => 25,  :null => false
    t.string "company_id", :limit => 25
    t.string "title",      :limit => 100
    t.string "internship", :limit => 1
    t.string "technical",  :limit => 1
    t.string "job_url",    :limit => 250
  end

  create_table "saved_companies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "saved_jobs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scraped_jobs", :force => true do |t|
    t.string   "title"
    t.integer  "company_id"
    t.string   "url"
    t.datetime "last_checked"
    t.text     "description"
    t.string   "experience_required"
    t.datetime "date_posted"
    t.string   "source"
    t.string   "source_unique_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "scrapers", :force => true do |t|
    t.string   "title"
    t.integer  "company_id"
    t.string   "url"
    t.datetime "last_checked"
    t.text     "description"
    t.string   "experience_required"
    t.string   "date_pos"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "tags", :force => true do |t|
    t.text     "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "temp_companies", :force => true do |t|
    t.text     "company_name"
    t.text     "company_url"
    t.text     "company_hiring"
    t.text     "company_jobs_url"
    t.text     "nocrunchbase"
    t.text     "name"
    t.text     "overview"
    t.text     "homepage_url"
    t.text     "employees"
    t.text     "category"
    t.text     "description"
    t.text     "founded_year"
    t.text     "founded_month"
    t.text     "money_raised"
    t.text     "crunchbase_url"
    t.text     "tag_list"
    t.text     "twitter_name"
    t.text     "blog_url"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "user_ids", :force => true do |t|
    t.string   "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
