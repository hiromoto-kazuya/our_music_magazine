class CreateArticleHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :article_hashtags do |t|
      t.integer :article_id
      t.integer :hashtag_id
      t.timestamps
    end
    add_index :article_hashtags, :article_id
    add_index :article_hashtags, :hashtag_id
  end
end
