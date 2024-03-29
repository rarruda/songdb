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

ActiveRecord::Schema.define(version: 20140501042547) do

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songbooks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "author"
    t.string   "composer"
    t.string   "translator"
    t.string   "copyright"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.integer  "songbook_id"
    t.string   "songbook_ref"
    t.string   "key_signature"
    t.string   "time_signature"
    t.string   "tempo"
  end

  create_table "verse_types", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "shortcut_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "color_id",     default: 0
  end

  create_table "verses", force: true do |t|
    t.integer  "song_id"
    t.integer  "position"
    t.integer  "verse_type_id"
    t.string   "note"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
