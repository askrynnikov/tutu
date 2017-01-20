class Ticket < ApplicationRecord
  validates :passenger_name, presence: true
  validates :passenger_passport, presence: true

  belongs_to :train
  belongs_to :user, optional: true
  belongs_to :start_station, class_name: RailwayStation
  belongs_to :end_station, class_name: RailwayStation

  after_create :send_notification

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
end
