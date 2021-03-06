class DriversTruck < ApplicationRecord
  belongs_to :driver
  belongs_to :truck 

  accepts_nested_attributes_for :driver, :truck

  #validaciones
  validates_presence_of :assignment_date
  #validates :driver_id, uniqueness: { scope: :truck_id, message: "Conductor solo puede usar un vehiculo a la vez" }
  validate :fecha_asignacion_pasado, :fecha_asignacion_futuro
  validates :assignment_date, uniqueness: { scope: [:driver_id, :truck_id] }     
  validates :truck_id, uniqueness: { scope: [:assignment_date] }     


  def fecha_asignacion_pasado 
    if !assignment_date.blank? && assignment_date < Date.today 
      errors.add(:assignment_date, "Fecha incorrecta, no se puede asignar al pasado") 
    end 
  end

  def fecha_asignacion_futuro 
    if !assignment_date.blank? && assignment_date > Date.today+30 
      errors.add(:assignment_date, "Fecha incorrecta, no se puede asignar un camion despues de 30 dias")
    end
  end  

  #def validar_asignaciones_multiples 

    #asignaciones = DriversTruck.all 
    #asignaciones.each do |asignacion| 
      #if beginning_date > asignacion.beginning_date && beginning_date < asignacion.ending_date 
        #errors.add(:beginning_date, " El vehiculo esta ocupado durante esas fechas") 
      #elsif ending_date > asignacion.beginning_date && ending_date < asignacion.ending_date 
        #errors.add(:beginning_date, " El vehiculo ya esta reservado hasta esta fecha ")
      #end 
    #end
  #end


end