class AddColumnArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :hashtag, :string, limit:100
  end
end
