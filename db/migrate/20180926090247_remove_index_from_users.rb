class RemoveIndexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, [:uid,:provider]
    remove_columns :users, :uid, :provider
  end
end
