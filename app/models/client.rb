class Client < ApplicationRecord
  has_many :orders, inverse_of: :client
  has_many :products, through: :orders


  VALID_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
  validates :first_name, length: { in: 3..50 }, format: { with: VALID_NAME_REGEX }, presence: true
  validates :last_name, length: { in: 3..50 }, format: { with: VALID_NAME_REGEX }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, confirmation: { case_sensitive: false }, uniqueness: true, length: { in: 7..254 }, presence: true
  validates :address, length: { in: 10..254 }, presence: true
  validates :phone, phone: true, presence: true, uniqueness: true
  VALID_RUT_REGEX = /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i
  validates :rut, rut: true, uniqueness: true, presence: true, format: { with: VALID_RUT_REGEX }

  def fullName 
  	[first_name, last_name].compact.join(' ')
  end

end
