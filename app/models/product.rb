class Product < ApplicationRecord
  has_many :orders, inverse_of: :products
  has_many :clients, through: :orders

  validates :detail, presence: true, length: { in: 4..20 , :message => " Se requiere mas informacion en detalles"}
  validates :price, {presence: true, numericality: { only_integer: true , :message => "El precio no tiene formato valido"}
  validates :product_number, presence: true, numericality: { only_integer: true , :message => "El numero de producto no tiene formato valido"}, length: { in: 3..3 , :message => "El numero del producto debe ser de 3 cifras"}, uniqueness: true
  validates :stock, presence: true, numericality: { only_integer: true , :message => "El stock no tiene formato valido"}
  validates :liters, presence:true, numericality: true, length: { in: 1..3 , :message => "La cantidad de litros no debe superar las 3 cifras"}
end
