class CreatePodcasts < ActiveRecord::Migration[6.1]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :category
      t.string :sub_category
      t.string :url
      t.string :source

      t.timestamps
    end
  end
end
