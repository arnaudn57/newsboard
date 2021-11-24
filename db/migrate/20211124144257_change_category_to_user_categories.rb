class ChangeCategoryToUserCategories < ActiveRecord::Migration[6.1]
  def change
    change_column :user_categories, :category, "varchar[] USING (string_to_array(category, ','))"
  end
end
