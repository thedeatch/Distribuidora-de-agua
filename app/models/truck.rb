class Truck < ApplicationRecord
    has_and_belongs_to_many :drivers

    validates :name, presence: true
    validates :load, presence: true
    validates :number_plate, presence: true 
    validates :detail

end
