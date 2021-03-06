class SleepingCar < Car
  NIL_PLACES = %i(top_places top_side_places lower_side_places seat_places).freeze

  validates :lower_places, presence: true, numericality: { only_integer: true }

  before_validation :set_nil

  def nil_places
    NIL_PLACES
  end
end
