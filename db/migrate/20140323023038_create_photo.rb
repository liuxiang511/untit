class CreatePhoto < ActiveRecord::Migration
  def change
    remove_column :firm_infos,:photo_id
    create_table :photos do |t|
      t.integer :firm_info_id
      t.string :photo_type
      t.string :photo_name
      t.string :photo_path
      t.timestamps
    end
  end
end
