class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: RailwayStation, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :cars

  delegate :compartment_cars, :seat_cars, to: :cars

  def number_compartment_cars
    compartment_cars.size
  end

  def top_places_in_compartment_cars
    compartment_cars.reduce(0) do |sum, val|
      sum + val.top_places
    end
  end

  def lower_places_in_compartment_cars
    compartment_cars.reduce(0) do |sum, val|
      sum + val.lower_places
    end
  end

  def number_seat_cars
    seat_cars.size
  end

  def top_places_in_seat_cars
    seat_cars.reduce(0) do |sum, val|
      sum + val.top_places
    end
  end

  def lower_places_in_seat_cars
    seat_cars.reduce(0) do |sum, val|
      sum + val.lower_places
    end
  end

end
