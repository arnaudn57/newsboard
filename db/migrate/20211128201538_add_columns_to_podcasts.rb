class AddColumnsToPodcasts < ActiveRecord::Migration[6.1]
  def change
    add_column :podcasts, :image, :string
    add_column :podcasts, :audio, :string
    add_column :podcasts, :description, :string
  end
end
