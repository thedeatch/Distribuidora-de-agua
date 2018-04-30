class Truck < ApplicationRecord
    has_many :orders
    has_many :products, through => :orders
    has_many :clients, through => :orders
    has_and_belongs_to_many :drivers

    validates :name, presence: true, length: { in: 8..80 }
    validates :load, presence: true, numericality :true
    validates :number_plate, presence: true
    validates :detail, length: { in: 7..254 }

end
