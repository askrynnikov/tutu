class AddFieldsToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :top_side_places, :integer
    add_column :cars, :lower_side_places, :integer
    add_column :cars, :seat_places, :integer
  end
end
