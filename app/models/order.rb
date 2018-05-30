class Order < ApplicationRecord

  belongs_to :product
  belongs_to :client
  belongs_to :truck

  validate :fecha_de_orden_pasado
  validate :fecha_de_entrega_pasado
  validates :amount, presence: true, numericality: { only_integer: true }

  def fecha_de_orden_pasado
    if !order_date.blank? && order_date < Date.today
      errors.add(:order_date, "Fecha incorrecta, la orden no puede ser en el pasado")
    end
  end

  def fecha_de_entrega_pasado
    if !delivery_date.blank? && delivery_date < Date.today
      errors.add(:delivery_date, "Fecha incorrecta, la entrega no puede ser en el pasado")
    end
  end

end
