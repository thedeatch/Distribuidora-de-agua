class Truck < ApplicationRecord
    has_many :orders, inverse_of: :truck
    has_many :products, through: :orders
    has_many :clients, through: :orders
    has_and_belongs_to_many :drivers
    VALID_NUMBERPLATE_REGEX = /[A-Z]{2}([A-Z]{2}|[0-9]{2})[0-9]{2}/
    validates :name, presence: true, length: { in: 8..80 }
    validates :load, presence: true, numericality: :true
    validates :number_plate, presence: true, length: { in: 6..6 }, format: {with: VALID_NUMBERPLATE_REGEX}
    validates :detail, length: { in: 4..254 }


end
