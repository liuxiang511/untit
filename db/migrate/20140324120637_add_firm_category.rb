class AddFirmCategory < ActiveRecord::Migration
  def change
    create_table :firm_categories do |t|
      t.integer :firm_info_id
      t.string :name
      t.integer :parent_id
      t.timestamps
    end
    add_index :firm_categories,:firm_info_id
    add_index :firm_categories,:parent_id
  end
end
