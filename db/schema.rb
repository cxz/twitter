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

ActiveRecord::Schema.define(:version => 20130131065213) do

  create_table "admins", :force => true do |t|
    t.string   "nickname",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admins", ["nickname"], :name => "index_admins_on_nickname"

  create_table "heartbeats", :force => true do |t|
    t.boolean  "alive",          :null => false
    t.string   "last_tweet_uid"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "answer"
    t.string   "uid"
    t.boolean  "open",       :default => true, :null => false
    t.integer  "kind",       :default => 0,    :null => false
  end

  create_table "replies", :force => true do |t|
    t.string   "uid",                             :null => false
    t.string   "text",                            :null => false
    t.string   "user_uid",                        :null => false
    t.string   "question_uid",                    :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "is_correct",   :default => false
  end

  add_index "replies", ["question_uid"], :name => "index_replies_on_question_uid"
  add_index "replies", ["user_uid"], :name => "index_replies_on_user_uid"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "admin",      :default => false, :null => false
    t.string   "nickname"
    t.string   "image"
  end

  add_index "users", ["uid"], :name => "index_users_on_uid"

end
