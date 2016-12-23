class SeatCar < Car
  NIL_PLACES = %i(top_places lower_places top_side_places lower_side_places).freeze
  validates :seat_places, presence: true, numericality: { only_integer: true }

  before_validation :set_nil

  def nil_places
    NIL_PLACES
  end
end
