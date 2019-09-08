class AddQuantityToJoinCartsItem < ActiveRecord::Migration[5.2]
  def change
    add_column :join_table_carts_items, :quantity, :integer, default: 1
  end
end
