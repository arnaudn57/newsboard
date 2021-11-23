class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :category, :string
    add_column :users, :sub_category, :string
    add_column :users, :media_type, :string
    add_column :users, :available_time, :integer
  end
end
