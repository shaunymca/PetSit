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

ActiveRecord::Schema.define(:version => 20140314212733) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "client_prices", :force => true do |t|
    t.decimal  "price"
    t.string   "visit_type"
    t.integer  "client_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "default_price_id"
    t.boolean  "custom",           :default => true
  end

  create_table "clients", :force => true do |t|
    t.string   "email"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "phone_number"
    t.string   "cell_phone"
    t.string   "emergency_phone"
    t.string   "security_code"
    t.text     "additional_notes"
    t.integer  "account_id"
  end

  create_table "default_prices", :force => true do |t|
    t.integer  "user_id"
    t.string   "visit_type"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "account_id"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "client_id"
    t.datetime "due_date"
    t.boolean  "paid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "visit_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "account_id"
  end

  create_table "pets", :force => true do |t|
    t.integer  "client_id"
    t.string   "animal_name"
    t.string   "pet_type"
    t.string   "breed"
    t.string   "color"
    t.boolean  "fixed"
    t.datetime "birthdate"
    t.boolean  "active"
    t.string   "sex"
    t.text     "notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => ""
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
    t.string   "name"
    t.string   "customer_id"
    t.string   "last_4_digits"
    t.string   "time_zone"
    t.string   "company_name"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "account_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "visit_blocks", :force => true do |t|
    t.string   "visit_type"
    t.integer  "visit_price"
    t.datetime "visit_date_start"
    t.datetime "visit_date_end"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "client_id"
    t.time     "visit_time"
    t.integer  "user_id"
  end

  create_table "visits", :force => true do |t|
    t.integer  "client_id"
    t.string   "visit_type"
    t.integer  "visit_price"
    t.datetime "visit_date"
    t.integer  "invoice_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "visit_block_id"
    t.datetime "end_time"
    t.integer  "user_id"
  end

end
