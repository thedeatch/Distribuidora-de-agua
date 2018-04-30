class Order < ApplicationRecord


  validates :order_date, presence: true
  validates :delivery_date, presence: true
  validates :amount, presence: true, numericality: true, only_integer : true



end
