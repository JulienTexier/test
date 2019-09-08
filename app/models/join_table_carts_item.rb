class JoinTableCartsItem < ApplicationRecord
	belongs_to :cart
	belongs_to :item

	def total_price
		price = 0.0
		self.quantity.times do
			price += self.item.price
		end
		return price
	end
end
