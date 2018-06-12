class Product < ApplicationRecord
  has_many :orders, inverse_of: :products
  has_many :clients, through: :orders

  validates :detail, presence: true, length: { in: 4..20 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :product_number, presence: true, numericality: { only_integer: true }, length: { in: 3..3 }, uniqueness: true
  validates :stock, presence: true, numericality: { only_integer: true }
  validates :liters, presence:true, numericality: true, length: { in: 1..3 }
end
