class AddRailwayStationRefToTrains < ActiveRecord::Migration[5.0]
  def change
    add_reference :trains, :current_station, foreign_key: true
  end
end
