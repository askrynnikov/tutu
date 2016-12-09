class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: RailwayStation, optional: true
  has_many :tickets
end
