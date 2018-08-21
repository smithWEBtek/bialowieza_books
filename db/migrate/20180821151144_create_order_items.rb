class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :book_id
      t.integer :cart_id

      t.timestamps null: false 
    end
  end
end
