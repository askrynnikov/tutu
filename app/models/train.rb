class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: RailwayStation, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :cars #, -> { order('cars.car_order DESC') }

  delegate :compartment_cars, :seat_cars, :economy_cars, :sleeping_cars, to: :cars

  def number_compartment_cars
    compartment_cars.size
  end

  def number_economy_cars
    economy_cars.size
  end

  def count_places(type_car, type_place)
    cars.where(type: type_car.to_s).sum(type_place)
  end
end
