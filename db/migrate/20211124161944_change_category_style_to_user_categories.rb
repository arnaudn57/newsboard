class ChangeCategoryStyleToUserCategories < ActiveRecord::Migration[6.1]
  def change
    change_column :user_categories, :category, :string
  end
end
