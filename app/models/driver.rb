class Driver < ApplicationRecord
    has_and_belongs_to_many :trucks

    VALID_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
    validates :first_name, presence: {message: 'ingrese nombre'}, length: { in: 3..50 }, format: {with: VALID_NAME_REGEX}
    validates :last_name, presence: {message: 'ingrese apellido'}, length: { in: 3..50 }, format: {with: VALID_NAME_REGEX}
    validate :fecha_nacimiento_futuro
    validates :income, presence: {message: 'ingrese sueldo'}, numericality: { only_integer: true }
    validates :license, inclusion: { in: [ true, false ] }
    validates_with RutValidator

    def fecha_nacimiento_futuro
        if birthday >= Date.today
            errors.add(:birthday, "Fecha de nacimiento incorrecta, el conductor no pudo haber nacido hoy o en el futuro")
        end
    end

    
