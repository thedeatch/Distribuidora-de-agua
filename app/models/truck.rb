class Truck < ApplicationRecord
    has_many :orders
    has_many :products, through => :orders
    has_many :clients, through => :orders
    has_and_belongs_to_many :drivers

    validates :name, presence: true, length: { in: 8..80 }
    validates :load, presence: true, numericality :true
    validates :number_plate, presence: true
    validates :detail, length: { in: 7..254 }

    p = "AAN212"

  def nplate(string)
    re = /[A-Z]{2}([A-Z]{2}|[0-9]{2})[0-9]{2}/
    number_plate = re.match(string)
    if number_plate
      return true
    else
      return false
    end
  end

  puts nplate(p)

end
