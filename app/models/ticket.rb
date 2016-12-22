class Ticket < ApplicationRecord
  validates :passenger_name, presence: true
  validates :passenger_passport, presence: true

  belongs_to :train
  belongs_to :user, optional: true
  belongs_to :start_station, class_name: RailwayStation
  belongs_to :end_station, class_name: RailwayStation
end
