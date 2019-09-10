ActiveRecord::Schema.define(version: 2019_08_31_152100) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "title", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.bigint "document_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_group_id"], name: "index_documents_on_document_group_id"
  end

  create_table "form_bundles", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.bigint "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_form_bundles_on_document_id"
    t.index ["form_id"], name: "index_form_bundles_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.date "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_news_posts_on_user_id"
  end

  create_table "service_mappings", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_service_mappings_on_document_id"
    t.index ["service_id"], name: "index_service_mappings_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "sif"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "documents", "document_groups"
  add_foreign_key "form_bundles", "documents"
  add_foreign_key "form_bundles", "forms"
  add_foreign_key "news_posts", "users"
  add_foreign_key "service_mappings", "documents"
  add_foreign_key "service_mappings", "services"
end
