class CreateCity < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :serialId
      t.string :cityId
      t.string :cityName
      t.string :cityUpId
      t.integer :cityUpIdNum
      t.string :cityPath
      t.string :cityType
      t.integer :cityTypeNum
      t.string :shortName
      t.string :spell
      t.string :areaId
      t.string :postCode
    end
    add_index :cities ,:serialId
    add_index :cities, :cityId
    add_index :cities, :cityUpId
  end
end
