class Driver < ApplicationRecord
    has_and_belongs_to_many :trucks

    VALID_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
    validates :first_name, presence: {message: 'ingrese nombre'}, length: { in: 3..50 }, format: {with: VALID_NAME_REGEX}
    validates :last_name, presence: {message: 'ingrese apellido'}, length: { in: 3..50 }, format: {with: VALID_NAME_REGEX}
    validate :fecha_nacimiento_futuro, :mayor_de_edad
    validates :income, presence: {message: 'ingrese sueldo'}, numericality: { only_integer: true }
    validates :license, inclusion: { in: [ true, false ] }
    validates :rut, rut: true, uniqueness: true, presence: true
    #validates_with RutValidator

    def fecha_nacimiento_futuro
        if birthday >= Date.today
            errors.add(:birthday, "Fecha de nacimiento incorrecta, el conductor no pudo haber nacido hoy o en el futuro")
        end
    end

    def age
      now = Time.now.utc.to_date
      now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
    end

    def mayor_de_edad
      if age < 18
        errors.add(:birthday, "Fecha de nacimiento incorrecta, el conductor no puede ser menor de edad")
      end
    end

end
