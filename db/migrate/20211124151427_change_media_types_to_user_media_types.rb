class ChangeMediaTypesToUserMediaTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :user_media_types, :media_types, "varchar[] USING (string_to_array(media_types, ','))"
  end
end
