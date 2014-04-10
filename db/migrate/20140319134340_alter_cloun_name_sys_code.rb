class AlterClounNameSysCode < ActiveRecord::Migration
  def change
    change_table :sys_codes do |t|
      t.rename :type ,:code_type
    end
  end
end
