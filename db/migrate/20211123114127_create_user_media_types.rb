class CreateUserMediaTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_media_types do |t|
      t.references :user, null: false, foreign_key: true
      t.string :media_types

      t.timestamps
    end
  end
end
