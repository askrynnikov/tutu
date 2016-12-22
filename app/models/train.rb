class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: RailwayStation, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  # has_many :cars, -> { order("car_order #{scoping}") }
  # has_many :cars, -> { order("car_order #{model_name.methods.public_methods}") }
  # has_many :cars, -> { order(car_order: train.car_ordering) }
  has_many :cars

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

  def car_ordering
    ordering ? 'asc' : 'desc'
  end
end
