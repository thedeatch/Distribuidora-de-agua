class Driver < ApplicationRecord
    has_and_belongs_to_many :trucks

    validates :first_name, presence: true {message: 'ingrese nombre'}
    validates :last_name, presence: {message: 'ingrese apellido'}
    validates :birthday, presence:{message: 'ingrese fecha de nacimiento'}
    validates :income, presence: {message: 'ingrese sueldo'}, numericality: true
    validates :license, presence: true
    validates :rut, uniqueness: {message: 'rut ingresado no es valido'}


end
