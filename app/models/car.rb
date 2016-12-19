class Car < ApplicationRecord
  before_validation :set_car_order
  validates :number, presence: true
  validates :car_order, uniqueness: { scope: :train_id }, allow_blank: true

  TYPES = %w(CompartmentCar SeatCar EconomyCar SleepingCar).freeze
  NIL_PLACES = %i(top_places lower_places top_side_places lower_side_places seat_places).freeze

  belongs_to :train, optional: true

  def self.types
    TYPES
  end

  # scope :seat_cars, -> { where(type: 'SeatCar') }
  TYPES.each do |type|
    scope type.pluralize.underscore.to_sym, -> { where(type: type) }
  end

  # default_scope( -> (order = :desc) { order(car_order: order) })

  scope :asc, -> { order(:car_order) }
  scope :desc, -> { order(car_order: :desc) }
  scope :ordered_by, -> (order) { order(car_order: order) }

  private

  def set_car_order
    self.car_order = (train.cars.maximum('car_order') || 0).next
  end

  def nil_places
    NIL_PLACES
  end

  def set_nil
    nil_places.each { |place_type| self[place_type] = nil }
  end
end
