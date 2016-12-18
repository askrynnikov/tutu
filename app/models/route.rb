class Route < ApplicationRecord
  validates :name, presence: true
  validate :station_count

  has_many :railway_stations_routes
  has_many :railway_stations,
           -> {order('railway_stations_routes.station_order')},
           through: :railway_stations_routes
  has_many :trains

  before_validation :set_name

  private

  def station_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 station")
    end
  end

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end
end
