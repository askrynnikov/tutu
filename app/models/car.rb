class Car < ApplicationRecord
  TYPES = %w(CompartmentCar SeatCar).freeze

  belongs_to :train, optional: true

  def self.types
    TYPES
    # %w(CompartmentCar SeatCar)
  end

  # scope :compartment_cars, -> { where(type: 'CompartmentCar') }
  # scope :seat_cars, -> { where(type: 'SeatCar') }
  self.types.each do |type|
    scope type.underscore.to_sym, -> { where(type: type) }
  end
end
