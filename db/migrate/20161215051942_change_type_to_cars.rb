class ChangeTypeToCars < ActiveRecord::Migration[5.0]
  def change
    change_column_null :cars, :type, false
  end
end
