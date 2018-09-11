class Truck < ApplicationRecord
    has_many :orders, inverse_of: :truck, :dependent => :delete_all
    has_many :products, through: :orders
    has_many :clients, through: :orders
    has_many :drivers_trucks, :dependent => :delete_all
    has_many :drivers, :through => :drivers_trucks


    VALID_NUMBERPLATE_REGEX = /[A-Z]{2}([A-Z]|[0-9]){2}[0-9]{2}/i
    validates :name, presence: { message: "no puede estar en blanco" }, length: { in: 3..80 , :message => "La marca debe ser a lo menos de 3 caracteres"}
    validates :load, presence: { message: "no puede estar en blanco" }, numericality: { message: "no es un numero" }
    validates :number_plate, presence: { message: "no puede estar en blanco" }, length: { in: 6..6 , :message => "La patente debe tener 6 caracteres"}, format: {with: VALID_NUMBERPLATE_REGEX , message: "es invalido" }, uniqueness: { message: "patente ya existe"}
    before_save :uppercase_numberplate
    #validates :detail, length: { in: 4..254 , :message => "La descripcion requiere mas informacion "}

    def uppercase_numberplate
        self.number_plate.upcase!
    end

    def fullModel
      [name, number_plate].compact.join(' , ')
    end
end
