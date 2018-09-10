class DriversTruck < ApplicationRecord
  belongs_to :driver
  belongs_to :truck 

  accepts_nested_attributes_for :driver, :truck

  #validaciones

  #validates :day, presence: true, uniqueness: { scope: [:driver_id, :truck_id] }  
  validates :driver_id, uniqueness: { scope: :truck_id, message: "Conductor solo puede usar un vehiculo a la vez" }
  validate :fecha_asignacion_pasado 
  validate :fecha_asignacion_futuro    


  def fecha_asignacion_pasado 
    if !day.blank? && day < Date.today 
      errors.add(:day, "Fecha incorrecta, no se puede asignar al pasado") 
    end 
  end

  def fecha_asignacion_futuro 
    if !day.blank? && day > Date.today+30 
      errors.add(:day, "Fecha incorrecta, no se puede asignar un camion despues de 30 dias")
    end
  end  



end