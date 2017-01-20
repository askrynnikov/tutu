class AddRailwayStationRefToTrains < ActiveRecord::Migration[5.0]
  def change
    add_reference :trains, :current_station, foreign_key:  {to_table: :railway_stations}
  end
end
