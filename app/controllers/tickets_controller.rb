class TicketsController < ApplicationController
  before_action :hidden_params, only: [:new]
  before_action :set_ticket, only: [:show]

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def new
    # @ticket = Ticket.new(train_id: params[:train_id], start_station_id: params[:start_station_id], end_station_id: params[:end_station_id])
    # не забывать про возможности slice в Rails
    @ticket = Ticket.new(params.slice(:train_id, :start_station_id, :end_station_id))
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passenger_passport)
  end

  def hidden_params
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
