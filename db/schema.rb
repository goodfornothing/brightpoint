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

ActiveRecord::Schema.define(:version => 20120519112303) do

  create_table "data_sets", :force => true do |t|
    t.string   "chromosome"
    t.integer  "start_point", :limit => 8
    t.integer  "end_point",   :limit => 8
    t.integer  "y_point",     :limit => 8
    t.string   "probe"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "data_sets", ["chromosome"], :name => "index_data_sets_on_chromosome"
  add_index "data_sets", ["end_point"], :name => "index_data_sets_on_end_point"
  add_index "data_sets", ["probe"], :name => "index_data_sets_on_probe"
  add_index "data_sets", ["start_point"], :name => "index_data_sets_on_start_point"
  add_index "data_sets", ["y_point"], :name => "index_data_sets_on_y_point"

end
