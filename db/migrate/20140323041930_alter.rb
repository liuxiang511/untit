class Alter < ActiveRecord::Migration
  def change
    remove_column :firm_infos, :province_id
    remove_column :firm_infos, :city_id
    remove_column :firm_infos, :district_id
    add_column :firm_infos, :province_id, :string
    add_column :firm_infos, :city_id, :string
    add_column :firm_infos, :district_id, :string
  end
end
