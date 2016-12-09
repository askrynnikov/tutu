class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :trains
  has_many :tickets_initial_station, class_name:Ticket
  has_many :tickets_final_station, class_name:Ticket
end
