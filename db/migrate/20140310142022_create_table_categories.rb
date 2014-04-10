class CreateTableCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :cate_id
      t.string :name
      t.integer :parent_id
      t.integer :status
    end
  end
end
