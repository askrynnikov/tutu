class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :trains, class_name: Train, foreign_key: 'current_station_id'
  has_many :tickets_initial_station, class_name: Ticket, foreign_key: 'initial_station_id'
  has_many :tickets_final_station, class_name: Ticket, foreign_key: 'final_station_id'
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
end
