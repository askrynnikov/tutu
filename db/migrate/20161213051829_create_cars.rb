class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :number
      t.integer :top_places
      t.integer :lower_places
      t.references :train, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
