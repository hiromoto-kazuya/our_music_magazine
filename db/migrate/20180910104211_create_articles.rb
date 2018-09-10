class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string   :title,    null: false, default: "", limit: 500
      t.text     :content,  null: false, default: ""
      t.integer  :genre_id, null: false, default: "1"

      t.timestamps
    end
    add_index :articles, :title
    add_index :articles, :content
    add_index :articles, :genre_id
  end
end
