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

ActiveRecord::Schema.define(:version => 20111018202217) do

  create_table "contestants", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "eliminated",   :default => false
    t.integer  "multiplier"
    t.integer  "latest_score"
  end

  create_table "contests", :force => true do |t|
    t.datetime "contest_start"
    t.datetime "contest_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "keywords", :force => true do |t|
    t.string   "word"
    t.string   "effect"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", :force => true do |t|
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "scores", :force => true do |t|
    t.integer  "value"
    t.integer  "contestant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contest_id"
  end

  create_table "search_terms", :force => true do |t|
    t.string   "value"
    t.integer  "contestant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "search_terms", ["contestant_id"], :name => "index_search_terms_on_contestant_id"

end
