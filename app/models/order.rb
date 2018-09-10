class Order < ApplicationRecord

  belongs_to :product, inverse_of: :orders
  belongs_to :client, inverse_of: :orders, dependent: :destroy
  belongs_to :truck, inverse_of: :orders

  accepts_nested_attributes_for :product, :client, :truck

  after_save :restar_del_stock

  #validaciones

  validates :delivery_date, presence: { message: "no puede estar en blanco" }
  validate :fecha_de_entrega_pasado
  validate :fecha_de_entrega_futuro
  validates :amount, presence: { message: "no puede estar en blanco" }, numericality: { only_integer: true , :message => "La cantidad no tiene formato valido"}
  validate :stock_negativo


  def fecha_de_entrega_pasado
    if !delivery_date.blank? && delivery_date < Date.today
      errors.add(:delivery_date, "Fecha incorrecta, la entrega no puede ser en el pasado")
    end
  end

  def fecha_de_entrega_futuro
    if !delivery_date.blank? && delivery_date > Date.today+90
      errors.add(:delivery_date, "Fecha incorrecta, la entrega no puede ser despues de 90 dias")
    end
  end

  def stock_negativo

    if !self.amount.blank? && product.stock <= self.amount
      errors.add(:amount, "No se puede pedir una cantidad mayor al stock del producto, ingrese una cantidad menor a "+ product.stock.to_s)
    end

  end

  #metodos

  def restar_del_stock
    product.stock -= self.amount
    product.save
  end

  def calcular_valor 
    valor = self.amount*self.product.price
  end
end
