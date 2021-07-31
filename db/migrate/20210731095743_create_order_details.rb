class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      
      
      t.integer :price, null: false
      t.integer :amont, null: false

      t.timestamps
    end
  end
end
