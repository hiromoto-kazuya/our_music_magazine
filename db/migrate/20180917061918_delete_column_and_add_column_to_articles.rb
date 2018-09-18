class DeleteColumnAndAddColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :hashtag, :string
    add_column :articles, :hashtag, :string, limit: 100
  end
end
