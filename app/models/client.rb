class Client < ApplicationRecord
  has_many :orders, inverse_of: :client
  has_many :products, through: :orders


  VALID_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
  validates :first_name, length: { in: 2..50 , :message => " El nombre tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El nombre no tiene formato valido"}
  validates :last_name, length: { in: 2..50 , :message => " El apellido tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El apellido no tiene formato valido"}, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, confirmation: { case_sensitive: false }, uniqueness: true, length: { in: 7..254 , :message => " El correo debe estar los 7 a 254 caracteres"}, presence: true
  validates :address, length: { in: 10..254 , :message => " La direccion debe estar los 10 a 254 caracteres"}, presence: true
  validates :phone, phone: true, presence: true, uniqueness: true
  VALID_RUT_REGEX = /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i
  validates :rut, rut: true, uniqueness: true, presence: true, format: { with: VALID_RUT_REGEX , :message => "El rut no tiene formato valido"}

  #metodos

  def fullName
  	[first_name, last_name].compact.join(' ')
  end

end
