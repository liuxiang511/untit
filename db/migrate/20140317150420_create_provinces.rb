class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.integer :serialId
      t.string :provinceId
      t.string :provinceName
      t.string :provinceUpId
      t.integer :provinceUpIdNum
      t.string :provincePath
      t.string :provinceType
      t.integer :provinceTypeNum
      t.string :shortName
      t.string :spell
      t.string :areaId
      t.string :postCode
    end
    add_index :provinces ,:provinceId
    add_index :provinces ,:provinceUpId
  end
end
