class Order < ApplicationRecord

  belongs_to :product, inverse_of: :orders
  belongs_to :client, inverse_of: :orders
  belongs_to :truck, inverse_of: :orders

  accepts_nested_attributes_for :product, :client, :truck

  validates :delivery_date, presence: true
  validate :fecha_de_entrega_pasado
  validate :fecha_de_entrega_futuro
  validates :amount, presence: true, numericality: { only_integer: true }


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

end
