class AddOrderingToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :ordering, :boolean, default: true
  end
end
