class DelAndCreateFirmInfo < ActiveRecord::Migration
  def change
    add_column :firm_infos, :main_product,:string
    add_column :firm_infos, :attr_a,:string
    add_column :firm_infos, :attr_b,:string
    add_column :firm_infos, :attr_c,:string
    add_column :firm_infos, :attr_d,:string
    add_column :firm_infos, :attr_e,:string
  end
end
