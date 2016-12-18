class AddStationOrderToRailwayStationsRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :station_order, :integer
  end
end
