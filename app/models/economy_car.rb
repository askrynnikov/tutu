class EconomyCar < Car
  validates :top_places, presence: true, numericality: { only_integer: true }
  validates :lower_places, presence: true, numericality: { only_integer: true }
  validates :top_side_places, presence: true, numericality: { only_integer: true }
  validates :lower_side_places, presence: true, numericality: { only_integer: true }

  before_validation :set_nil

  private

  def set_nil
    self.seat_places = nil
  end
end