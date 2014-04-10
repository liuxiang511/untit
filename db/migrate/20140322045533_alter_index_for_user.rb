class AlterIndexForUser < ActiveRecord::Migration
  def change
    remove_index :firm_infos, :firm_name
    remove_index :firm_infos, :web
    remove_index :firm_infos, :brand
    remove_index :concats, :mobile
    remove_index :concats, :phone
    remove_index :users, :email
    remove_index :users, :status
    remove_index :users, :username

    add_index :firm_infos, :firm_name
    add_index :firm_infos, :web
    add_index :firm_infos, :brand
    add_index :concats, :mobile
    add_index :concats, :phone
    add_index :users, :email
    add_index :users, :status
    add_index :users, :username

  end
end
