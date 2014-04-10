class CreateSysCode < ActiveRecord::Migration
  def change
    create_table :sys_codes do |t|
      t.string :type
      t.string :code
      t.string :value
    end
    add_index :sys_codes, :type
    add_index :sys_codes, :code
    add_index :sys_codes, :value
  end
end

