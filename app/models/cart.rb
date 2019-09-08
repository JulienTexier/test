class Cart < ApplicationRecord
	belongs_to :user
	has_many :join_table_carts_items, dependent: :destroy
	has_many :items, through: :join_table_carts_items

	def add_item(item)
		current_item = join_table_carts_items.find_by(item_id: item.id)
		if current_item
			current_item.increment(:quantity)
		else
			current_item = join_table_carts_items.new(item_id: item.id)
		end
		current_item
	end

	def subtotal
		price = 0.0
		self.join_table_carts_items.each do |cart_item|
			price += cart_item.total_price
		end
		return price
	end
end
