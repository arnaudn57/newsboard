class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :time_reading
      t.string :title
      t.string :image
      t.text :content
      t.string :category
      t.string :sub_category
      t.string :source
      t.string :url
      t.string :publish_date

      t.timestamps
    end
  end
end
