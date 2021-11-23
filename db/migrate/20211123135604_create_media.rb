class CreateMedia < ActiveRecord::Migration[6.1]
  def change
    create_table :media do |t|
      t.belongs_to :dashboard, null: false, foreign_key: true
      t.references :mediable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
