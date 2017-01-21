class TicketsController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user!, only: [:new, :create]
  # before_action :hidden_params, only: [:new]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
    # @ticket = Ticket.new(ticket_params)
    @test = nil
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      TicketsMailer.buy_ticket(self.user, self).deliver_now
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def new
    # @train = Train.find(params[:train_id])
    # @start_station = RailwayStation.find(params[:start_station_id])
    # @end_station = RailwayStation.find(params[:end_station_id])
    # @ticket = current_user.tickets.new(params.slice(:train_id,:start_station_id,:end_station_id))
    @ticket = current_user.tickets.new(train_id: params[:train_id],
                                       start_station_id: params[:start_station_id],
                                       end_station_id: params[:end_station_id])
  end

  def index
    @tickets = current_user.tickets
  end

  def edit
  end

  def update
    @train = Train.find(params[:train_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    TicketsMailer.pass_ticket(self.user, self).deliver_now
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passenger_passport)
  end

  # def hidden_params
  #   @train = Train.find(params[:train_id])
  #   @start_station = RailwayStation.find(params[:start_station_id])
  #   @end_station = RailwayStation.find(params[:end_station_id])
  # end

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end
end
