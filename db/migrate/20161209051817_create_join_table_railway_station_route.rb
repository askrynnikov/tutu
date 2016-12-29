class CreateJoinTableRailwayStationRoute < ActiveRecord::Migration[5.0]
  def change
    create_table :railway_stations_routes do |t|
      t.references :railway_station, foreign_key: true
      t.references :route, foreign_key: true
    end

    # create_join_table :railway_stations, :routes do |t|
    #   # t.index [:railway_station_id, :route_id]
    #   # t.index [:route_id, :railway_station_id]
    # end
  end
end
