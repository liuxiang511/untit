class AddCloumnToFirm < ActiveRecord::Migration
  def change
    add_column :firm_infos, :found_address,:string
    add_column :firm_infos, :firm_area,:string
    add_column :firm_infos, :firm_staff,:string
    add_column :firm_infos, :tech_staff,:string
    add_column :firm_infos, :main_market,:string
    add_column :firm_infos, :main_customer,:string

  end
end
