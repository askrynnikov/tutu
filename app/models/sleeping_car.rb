class SleepingCar < Car
  validates :lower_places, presence: true, numericality: { only_integer: true }

  before_validation :set_nil

  private

  def set_nil
    self.top_places = nil
    self.top_side_places = nil
    self.lower_side_places = nil
    self.seat_places = nil
  end
end
