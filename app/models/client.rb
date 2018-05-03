class Client < ApplicationRecord
  has_many :orders
  has_many :products, :through => :orders

  VALID_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
  validates :first_name, presence: true, length: { in: 3..50 }, format: {with: VALID_NAME_REGEX}
  validates :last_name, presence: true, length: { in: 3..50 }, format: {with: VALID_NAME_REGEX}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, confirmation: { case_sensitive: false }, uniqueness: true, length: { in: 7..254 },
  validates :address, presence: true, length: { in: 10..254 }
  validates :phone, presence: true, numericality: { only_integer: true }, length: { in: 8..15 }
  validates_with RutValidator
end
