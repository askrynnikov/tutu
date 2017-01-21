class AddIndexesToCars < ActiveRecord::Migration[5.0]
  def change
    add_index :cars, [:id, :type]
  end
end
