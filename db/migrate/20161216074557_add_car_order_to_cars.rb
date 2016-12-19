class AddCarOrderToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :car_order, :integer
  end
end
