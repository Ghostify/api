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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150719110850) do

  create_table "channels", force: true do |t|
    t.string   "url"
    t.string   "name"
    t.string   "progress"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority",   default: 0
  end

  create_table "links", force: true do |t|
    t.string   "full_link"
    t.string   "youtube_link"
    t.string   "progress"
    t.integer  "seen_count",          default: 0
    t.integer  "video_id"
    t.integer  "transcript_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transcript_provided"
    t.integer  "priority",            default: 0
  end

  create_table "videos", force: true do |t|
    t.text     "transcript"
    t.text     "compressed_text"
    t.integer  "channel_id"
    t.integer  "link_id"
    t.integer  "views"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.integer  "ups"
    t.integer  "downs"
    t.string   "video_link"
  end

end
