ActiveRecord::Schema.define(version: 2019_09_10_015120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "uuid", null: false
    t.integer "number_of_stickers", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uuid"], name: "index_albums_on_uuid"
  end

  create_table "collectors", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "uuid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_collectors_on_email"
    t.index ["uuid"], name: "index_collectors_on_uuid"
  end

end
