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

ActiveRecord::Schema.define(version: 20151221170112) do

  create_table "invitations", force: :cascade do |t|
    t.integer "lender_id"
    t.integer "loan_id"
  end

  add_index "invitations", ["lender_id"], name: "index_invitations_on_lender_id"
  add_index "invitations", ["loan_id"], name: "index_invitations_on_loan_id"

  create_table "loans", force: :cascade do |t|
    t.integer  "borrower_id"
    t.integer  "principal"
    t.decimal  "interest_apr"
    t.integer  "term_in_months"
    t.string   "reason"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "invitation_code"
  end

  add_index "loans", ["borrower_id"], name: "index_loans_on_borrower_id"

  create_table "people", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "crypted_password"
    t.string   "salt"
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true

  create_table "pledges", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "lender_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pledges", ["lender_id"], name: "index_pledges_on_lender_id"
  add_index "pledges", ["loan_id"], name: "index_pledges_on_loan_id"

end
