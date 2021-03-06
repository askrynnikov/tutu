class Route < ApplicationRecord
  validates :name, presence: true
  validate :station_count

  has_many :railway_stations_routes
  has_many :railway_stations,
           -> { order('railway_stations_routes.station_order') },
           through: :railway_stations_routes
  has_many :trains

  before_validation :set_name

  private

  def station_count
    errors.add(:base, "Route should contain at least 2 station") if railway_stations.size < 2
  end

  def set_name
    if self.name.empty?
      self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
    end
  end
end
