    class DriverTruck < ApplicationRecord
        belongs_to :driver
        belongs_to :truck
end
