class Car < ApplicationRecord
  belongs_to :train, optional: true

  def self.types
    %w(CompartmentCar SeatCar)
  end

  scope :compartment_cars, -> { where(type: 'CompartmentCar') }
  scope :seat_cars, -> { where(type: 'SeatCar') }
end
