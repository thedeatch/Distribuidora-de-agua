class Client < ApplicationRecord
  has_many :orders, inverse_of: :client
  has_many :products, through: :orders

#/^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$/u

  VALID_NAME_REGEX = /(?=^.{2,50}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/
  validates :first_name, length: { in: 2..50 , :message => " El nombre tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El nombre no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  validates :last_name, length: { in: 2..50 , :message => " El apellido tiene que estar entre 2 a 50 caracteres"}, format: { with: VALID_NAME_REGEX , :message => "El apellido no tiene formato valido"}, presence: { message: "no puede estar en blanco" }
  VALID_EMAIL_REGEX = /[a-z0-9]+[_a-z0-9.-][a-z0-9]+@[a-z0-9-]+(.[a-z0-9-]+)(.[a-z]{2,4})/
  validates :email, format: { with: VALID_EMAIL_REGEX , message: "es invalido" }, confirmation: { case_sensitive: false }, uniqueness: { message: "Ya existe" }, length: { in: 7..254 , :message => " El correo debe estar los 7 a 254 caracteres"}, presence: { message: "no puede estar en blanco" }
  validates :address, length: { in: 10..254 , :message => " La direccion debe estar los 10 a 254 caracteres"}, presence: { message: "no puede estar en blanco" }
  validates :phone, phone: { message: "es invalido" }, presence: { message: "no puede estar en blanco" }, uniqueness: { message: "Ya existe" }
  VALID_RUT_REGEX = /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i
  validates :rut, rut: { message: "es invalido" }, uniqueness: { message: "Ya existe" }, presence: { message: "no puede estar en blanco" }, format: { with: VALID_RUT_REGEX , :message => "El rut no tiene formato valido"}

  #metodos

  def fullName
  	[first_name, last_name].compact.join(' ')
  end

end
