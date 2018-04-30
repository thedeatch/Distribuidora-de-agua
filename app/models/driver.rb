class Driver < ApplicationRecord
    has_and_belongs_to_many :trucks

    validates :first_name, presence: {message: 'ingrese nombre'}, length: { in: 3..50 }
    validates :last_name, presence: {message: 'ingrese apellido'}, length: { in: 3..50 }
    validates :birthday, presence:{message: 'ingrese fecha de nacimiento'}
    validates :income, presence: {message: 'ingrese sueldo'}, numericality: { only_integer: true }
    validates :license, inclusion: { in: [ true, false ] }
    validates_with RutValidator


end
