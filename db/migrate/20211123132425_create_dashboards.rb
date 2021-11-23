class CreateDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :dashboards do |t|
      t.integer :time_reading
      t.references :user, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
