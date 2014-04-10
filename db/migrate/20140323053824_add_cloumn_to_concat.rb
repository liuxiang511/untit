class AddCloumnToConcat < ActiveRecord::Migration
  def change
    add_column :concats,:dept,:string
    add_column :concats,:staff,:string
  end
end
