class CreateProductPublish < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :firm_info_id
      t.integer :firm_category_id
      t.integer :product_calculate_id
      t.integer :name
      t.integer :category_id
      t.string :title
      t.integer :sum_count
      t.string :package_info
      t.string :special
      t.string :package_price
      t.string :order_info
      t.string :batch_info
      t.string :trade
      t.string :after_sale
      t.integer :min_order
      t.string :content
      t.string :captcha
      t.timestamps
    end
    add_index :products,:firm_info_id
    add_index :products,:firm_category_id
    add_index :products,:product_calculate_id
    add_column :photos, :product_id,:integer
    add_index :photos,:product_id
    create_table :product_calculates do |k|
      k.integer :product_id
      k.string :ceil
      k.integer :count
      k.float :price
      k.timestamps
    end
    add_index :product_calculates,:product_id
  end
end
