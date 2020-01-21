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

ActiveRecord::Schema.define(version: 2020_01_21_000011) do

  create_table "mails", force: :cascade do |t|
    t.integer "template_id", null: false
    t.string "subject", null: false
    t.string "to", null: false
    t.string "from", null: false
    t.date "deliver_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string "code", null: false
    t.text "mail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variables", force: :cascade do |t|
    t.integer "mail_id"
    t.date "court_date"
    t.string "civility"
    t.string "denomination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mail_id"], name: "index_variables_on_mail_id"
  end

end
