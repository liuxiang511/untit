class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :firm_info_id
      t.string :title
      t.string :concat
      t.string :phone
      t.string :mobile
      t.string :address
      t.string :post_code
      t.string :email
      t.string :content
      t.timestamps
    end
  end
end
