class AddColumnToDashboards < ActiveRecord::Migration[6.1]
  def change
    add_column :dashboards, :active, :boolean, default: true
  end
end
