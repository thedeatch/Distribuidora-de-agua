class Product < ApplicationRecord
  has_many :orders, inverse_of: :product, dependent: :delete_all
  has_many :clients, through: :orders

  validates :detail, presence: { message: "no puede estar en blanco" }, length: { in: 4..20 , :message => " Se requiere mas informacion en detalles"}
  validates :price, presence: { message: "no puede estar en blanco" }, numericality: { only_integer: true , :message => "El precio no tiene formato valido"}
  validates :product_number, presence: { message: "no puede estar en blanco" }, numericality: { only_integer: true , :message => "El codigo de producto no tiene formato valido"}, length: { in: 3..3 , :message => "Tiene que ser de 3 cifras"}, uniqueness: { message: "Ya existe" }
  validates :stock, presence: { message: "no puede estar en blanco" }, numericality: { only_integer: true , :message => "El stock no tiene formato valido"}




end
