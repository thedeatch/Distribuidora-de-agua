class Truck < ApplicationRecord
    has_many :orders, inverse_of: :truck
    has_many :products, through: :orders
    has_many :clients, through: :orders
    has_and_belongs_to_many :drivers
    VALID_NUMBERPLATE_REGEX = /[A-Z]{2}([A-Z]|[0-9]){2}[0-9]{2}/i
    validates :name, presence: { message: "no puede estar en blanco" }, length: { in: 3..80 , :message => "La marca debe ser superior a 3 caracteres"}
    validates :load, presence: { message: "no puede estar en blanco" }, numericality: { message: "no es un numero" }
    validates :number_plate, presence: { message: "no puede estar en blanco" }, length: { in: 6..6 , :message => "La patente debe tener 6 caracteres"}, format: {with: VALID_NUMBERPLATE_REGEX , message: "es invalido" }
    before_save :uppercase_numberplate
    validates :detail, length: { in: 4..254 , :message => "La descripcion requiere mas informacion "}

    def uppercase_numberplate
    	self.number_plate.upcase!
    end
end
