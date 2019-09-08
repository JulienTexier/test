class JoinItemsOrder < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def total_price
		price = 0.0
		self.quantity.times do
			price += self.item.price
		end
		return price
	end
end
