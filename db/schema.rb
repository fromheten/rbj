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

ActiveRecord::Schema.define(version: 20140815190337) do

  create_table "bitcoin_invoices", force: true do |t|
    t.integer  "job_id"
    t.string   "bitpay_id"
    t.float    "price"
    t.string   "currency"
    t.string   "notificationEmail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bitcoin_invoices", ["job_id"], name: "index_bitcoin_invoices_on_job_id"

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.string   "headquarters"
    t.text     "job_description"
    t.text     "how_to_apply"
    t.string   "company_name"
    t.string   "company_url"
    t.string   "email"
    t.boolean  "highlight"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
