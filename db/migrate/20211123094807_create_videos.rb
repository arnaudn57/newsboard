class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :category
      t.string :sub_category
      t.string :url

      t.timestamps
    end
  end
end
