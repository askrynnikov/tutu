class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :trains, class_name: Train, foreign_key: 'current_station_id'
  has_many :tickets_start_station, class_name: Ticket, foreign_key: 'start_station_id'
  has_many :tickets_end_station, class_name: Ticket, foreign_key: 'end_station_id'
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { joins(:railway_stations_routes)
                         .order("railway_stations_routes.station_order")
                         .distinct}
  def update_station_order_arrival_departure(route, params)
    # railway_station_route = railway_stations_routes.find_by(route: route)
    # railway_station_route = railway_stations_routes.where(route: route).first
    # railway_station_route.update_column(:station_order, station_order)
    # railway_station_route.update_attributes!(station_order: station_order) if railway_station_route
    railway_station_route = station_route(route)
    railway_station_route.update(station_order: params[:station_order],
                                 arrival: params[:arrival],
                                 departure: params[:departure]) if railway_station_route
  end

  def arrival_in(route)
    station_route(route).try(:arrival)
  end

  def departure_in(route)
    station_route(route).try(:departure)
  end

  def station_order_in(route)
    station_route(route).try(:station_order)
  end

  protected
  def station_route(route)
    @station_route = railway_stations_routes.where(route: route).first
  end
end
