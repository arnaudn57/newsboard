class CreateUserCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_categories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.boolean :sub_category

      t.timestamps
    end
  end
end
