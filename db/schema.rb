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

ActiveRecord::Schema.define(:version => 20120513051938) do

  create_table "companies", :force => true do |t|
    t.text     "name"
    t.text     "url"
    t.integer  "funding"
    t.integer  "employees"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "description"
    t.boolean  "hiring"
    t.text     "jobs_url"
    t.text     "overview"
    t.boolean  "crunchbase"
    t.datetime "founded"
    t.text     "twitter_name"
    t.text     "blog_url"
    t.text     "category"
    t.text     "crunchbase_url"
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
    t.boolean  "type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "last_updated"
  end

  create_table "saved_jobs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
