class CreateDistrict < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :serialId
      t.string :districtId
      t.string :districtName
      t.string :districtUpId
      t.integer :districtUpIdNum
      t.string :districtPath
      t.string :districtType
      t.integer :districtTypeNum
      t.string :shortName
      t.string :spell
      t.string :areaId
      t.string :serialId
      t.string :postCode
    end
    add_index :districts ,:serialId
    add_index :districts, :districtId
    add_index :districts, :districtUpId
  end
end
