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

ActiveRecord::Schema.define(version: 20160720140102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "depoimentos", force: :cascade do |t|
    t.text     "depoimento"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "depoimentos", ["user_id"], name: "index_depoimentos_on_user_id", using: :btree

  create_table "enderecos", force: :cascade do |t|
    t.string   "nome"
    t.string   "rua"
    t.string   "numero"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enderecos", ["user_id"], name: "index_enderecos_on_user_id", using: :btree

  create_table "medicamentos", force: :cascade do |t|
    t.string   "nome"
    t.string   "tipo"
    t.string   "validade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perfils", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "telefone"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "perfils", ["user_id"], name: "index_perfils_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "depoimentos", "users"
  add_foreign_key "enderecos", "users"
  add_foreign_key "perfils", "users"
end
