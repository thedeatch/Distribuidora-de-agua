class Order < ApplicationRecord

  belongs_to :product
  belongs_to :client
  belongs_to :truck

  validates :order_date, presence: true, date: true
  validates :delivery_date, presence: true, date: true
  validates :amount, presence: true, numericality: { only_integer: true }



end
