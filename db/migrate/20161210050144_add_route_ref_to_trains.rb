class AddRouteRefToTrains < ActiveRecord::Migration[5.0]
  def change
    add_reference :trains, :route, foreign_key: true
  end
end
