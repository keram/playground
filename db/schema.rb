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

ActiveRecord::Schema.define(version: 2018_07_05_192800) do

  create_table "escapes", force: :cascade do |t|
    t.text "payload", null: false
    t.text "error_message"
    t.string "organiser"
    t.string "prisoner"
    t.boolean "success", default: false, null: false
    t.string "ip_address", null: false
    t.integer "cell", default: 1024, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
