class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user, optional: true
  belongs_to :initial_station, class_name: RailwayStation
  belongs_to :final_station, class_name: RailwayStation
end
