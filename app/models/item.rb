class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_one_attached :cat_picture
  validates :title, presence: true, length: { in: 3..100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many :join_table_carts_items, dependent: :destroy
	has_many :carts, through: :join_table_carts_items
	has_many :join_items_orders, dependent: :destroy
	has_many :orders, through: :join_items_orders
end
