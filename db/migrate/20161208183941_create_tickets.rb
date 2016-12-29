class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :train, foreign_key: true
      t.references :user, foreign_key: true
      t.references :start_station, foreign_key: true
      t.references :end_station, foreign_key: true

      t.timestamps
    end
  end
end
