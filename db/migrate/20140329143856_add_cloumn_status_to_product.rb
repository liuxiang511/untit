class AddCloumnStatusToProduct < ActiveRecord::Migration
  def change
    add_column :products,:status,:string
    add_index :products,:status
  end
end
