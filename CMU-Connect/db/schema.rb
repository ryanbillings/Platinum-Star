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

ActiveRecord::Schema.define(:version => 20120320225626) do

  create_table "complaints", :force => true do |t|
    t.text     "description"
    t.integer  "rando_chat_id"
    t.string   "to_user"
    t.string   "from_user"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "conferences", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "public"
    t.string   "sessionId"
    t.string   "name"
    t.text     "description"
    t.integer  "host_id"
    t.boolean  "professional"
    t.string   "color"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "exchanges", :force => true do |t|
    t.integer  "rando_chat_id"
    t.boolean  "match"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rando_chats", :force => true do |t|
    t.string   "sessionId"
    t.integer  "u1_id"
    t.integer  "u2_id"
    t.boolean  "social"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "survey_users", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surveys", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "theme_chats", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "sessionId"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "topics", :force => true do |t|
    t.integer  "count"
    t.integer  "survey_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_confs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "conference_id"
    t.string   "andrew"
    t.boolean  "confirmed"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "andrew"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "major"
    t.string   "grade"
    t.string   "gender"
    t.string   "phone"
    t.string   "carrier"
    t.boolean  "receive_text"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
