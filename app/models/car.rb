class Car < ApplicationRecord
  before_validation :set_car_order
  validates :number, presence: true
  validates :car_order, uniqueness: { scope: :train_id}, allow_blank: true

  TYPES = %w(CompartmentCar SeatCar EconomyCar SleepingCar).freeze

  belongs_to :train, optional: true

  def self.types
    TYPES
  end

  # scope :seat_cars, -> { where(type: 'SeatCar') }
  TYPES.each do |type|
    scope type.pluralize.underscore.to_sym, -> { where(type: type) }
  end

  # default_scope { order(:car_order) }

  scope :asc, -> { order(:car_order) }
  scope :desc, -> { order('car_order DESC') }

  private

  def set_car_order
    self.car_order = (train.cars.maximum('car_order') || 0) +1
  end
end
