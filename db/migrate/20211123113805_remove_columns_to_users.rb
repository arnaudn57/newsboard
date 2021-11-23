class RemoveColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_columns :users, :category
    remove_columns :users, :sub_category
    remove_columns :users, :media_type
  end
end
