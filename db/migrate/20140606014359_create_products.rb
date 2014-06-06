class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productid
      t.string :product_name
      t.integer :price
      t.integer :category_id
      t.timestamps
    end
  end
end
