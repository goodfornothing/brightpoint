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

ActiveRecord::Schema.define(:version => 20120519151230) do

  create_table "annotations", :force => true do |t|
    t.integer  "classification_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "annotations_data_points", :force => true do |t|
    t.integer "annotation_id"
    t.integer "data_point_id"
  end

  create_table "classifications", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "data_points", :force => true do |t|
    t.string   "chromosome"
    t.integer  "start_point", :limit => 8
    t.integer  "end_point",   :limit => 8
    t.decimal  "y_point"
    t.string   "probe"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "data_points", ["chromosome"], :name => "index_data_sets_on_chromosome"
  add_index "data_points", ["end_point"], :name => "index_data_sets_on_end_point"
  add_index "data_points", ["probe"], :name => "index_data_sets_on_probe"
  add_index "data_points", ["start_point"], :name => "index_data_sets_on_start_point"
  add_index "data_points", ["y_point"], :name => "index_data_sets_on_y_point"

  create_table "data_points_subjects", :force => true do |t|
    t.integer "subject_id"
    t.integer "data_point_id"
  end

  create_table "subjects", :force => true do |t|
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
