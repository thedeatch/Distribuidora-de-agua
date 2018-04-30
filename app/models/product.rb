class Product < ApplicationRecord
  has_many :orders
  has_many :clients, :through => :orders

  validates :detail
  validates :price, presence:true, numericality: true
  validates :product_number, presence: true, numericality: true
  validates :stock, presence: true, numericality: true

end
