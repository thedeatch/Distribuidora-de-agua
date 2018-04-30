class Client < ApplicationRecord
  has_many :orders
  has_many :products, :through => :orders

  validates :first_name, presence: true, length: { in: 3..50 }
  validates :last_name, presence: true, length: { in: 3..50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },  confirmation: true, uniqueness: true length: { in: 7..254 }
  validates :address, presence: true
  validates :phone, presence: true, numericality: true, length: { in: 8..15 }
  validates :rut, presence: true, numericality: true

end
