class ChangeMediaTypesStyleToUserMediaTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :user_media_types, :media_types, :string
  end
end
