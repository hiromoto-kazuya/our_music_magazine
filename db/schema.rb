ActiveRecord::Schema.define(version: 2018_09_10_104211) do

  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",     limit: 500, default: "", null: false
    t.text     "content",               default: "", null: false
    t.integer  "genre_id",              default: 1,  null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["content"],  name: "index_articles_on_content"
    t.index ["genre_id"], name: "index_articles_on_genre_id"
    t.index ["title"],    name: "index_articles_on_title"
  end

end
