class SetFieldsPlacesDefault0ToCars < ActiveRecord::Migration[5.0]
  def change
    change_column_default :cars, :top_places, from: nil, to: 0
    change_column_default :cars, :lower_places, from: nil, to: 0
    change_column_default :cars, :top_side_places, from: nil, to: 0
    change_column_default :cars, :lower_side_places, from: nil, to: 0
    change_column_default :cars, :seat_places, from: nil, to: 0
  end
end
