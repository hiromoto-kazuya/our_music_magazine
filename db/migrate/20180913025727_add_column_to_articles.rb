class AddColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :catch_image, :text
  end
end
