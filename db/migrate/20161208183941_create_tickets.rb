class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :train, foreign_key: true
      t.references :user, foreign_key: true
      t.references :initial_station, foreign_key: true
      t.references :final_station, foreign_key: true

      t.timestamps
    end
  end
end
