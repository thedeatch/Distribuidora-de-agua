class Product < ApplicationRecord
  has_many :orders, inverse_of: :products
  has_many :clients, through: :orders

  validates :detail, presence: { message: "no puede estar en blanco" }, length: { in: 4..20 , :message => " Se requiere mas informacion en detalles"}
  validates :price, presence: { message: "no puede estar en blanco" }, numericality: { only_integer: true , :message => "El precio no tiene formato valido"}
  validates :product_number, presence: { message: "no puede estar en blanco" }, numericality: { only_integer: true , :message => "El codigo de producto no tiene formato valido"}, length: { in: 3..3 , :message => "Tiene que ser de 3 cifras"}, uniqueness: { message: "Ya existe" }
  validates :stock, presence: { message: "no puede estar en blanco" }, numericality: { only_integer: true , :message => "El stock no tiene formato valido"}
  validates :liters, presence:{ message: "no puede estar en blanco" }, numericality: { message: "no es un numero" }, length: { in: 1..3 , :message => "La cantidad de litros no debe superar las 3 cifras"}
end
