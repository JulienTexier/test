class AddQuantity < ActiveRecord::Migration[5.2]
  def change
  	add_column :join_items_orders, :quantity, :integer, default: 1
  end
end
