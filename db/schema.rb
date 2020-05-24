# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_24_205909) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "trades", force: :cascade do |t|
    t.datetime "data"
    t.string "esecuzione"
    t.string "symbol"
    t.string "sentiment"
    t.string "macropattern"
    t.string "zona_critica"
    t.float "angolo_trendline"
    t.string "nome_micro"
    t.string "note_micro"
    t.string "note_macro"
    t.datetime "data_micro"
    t.string "configurazione_pivot"
    t.string "configurazione_daily"
    t.string "pivot_giornalieri"
    t.string "distanza_pivot"
    t.string "rating"
    t.boolean "buy"
    t.string "timeframe"
    t.float "prezzo_entrata"
    t.float "prezzo_sl"
    t.float "lotti"
    t.float "tp1"
    t.float "tp2"
    t.string "risultato"
    t.string "ragioni_uscita"
    t.string "note"
    t.decimal "confidenza"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "resa"
    t.string "ostacoli_tp1"
    t.string "resa_tp2"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
