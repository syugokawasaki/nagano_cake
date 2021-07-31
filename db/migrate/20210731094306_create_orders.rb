class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.string :postal_code,    null: false
      t.string :address,        null: false
      t.string :name,           null: false
      t.integer :shipping_cost, null: false
      t.integer :total_amont,   null: false
      t.integer :payment,       null: false, default: 0
      

      t.timestamps
    end
  end
end
