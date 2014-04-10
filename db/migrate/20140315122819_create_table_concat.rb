class CreateTableConcat < ActiveRecord::Migration
  def change
    drop_table :concats
    create_table :concats do |t|
      t.integer :user_id
      t.string :name
      t.integer :sex
      t.string :mobile
      t.string :phone
      t.integer :photo_id
      t.integer :province_id
      t.integer :city_id
      t.integer :district_id
      t.string :address
      t.string :fax
      t.string :post_code
      t.string :email
      t.string :qq
      t.timestamps
    end
    add_index :concats, :user_id, :unique => true
    add_index :concats, :mobile, :unique => true
    add_index :concats, :phone, :unique => true
  end
end
