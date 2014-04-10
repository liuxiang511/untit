class AddIndexForPhoto < ActiveRecord::Migration
  def change
    add_index :photos, :firm_info_id
    add_index :photos, :photo_name
    add_index :photos, :photo_path
    add_index :photos, :photo_type
  end
end
