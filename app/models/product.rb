class Product < ApplicationRecord
  has_many :orders
  has_many :clients, :through => :orders

  validates :detail, presence: true, length: { in: 4..80 }
  validates :price, presence:true, numericality: { only_integer: true }
  validates :product_number, presence: true, numericality: { only_integer: true }
  validates :stock, presence: true, numericality: { only_integer: true }

end
