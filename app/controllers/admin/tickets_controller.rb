module Admin
  class TicketsController < Admin::BaseController
    before_action :hidden_params, only: [:new]
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    def show
    end

    def create
      @ticket = Ticket.new(ticket_params)
      if @ticket.save
        redirect_to [:admin, @ticket], notice: 'Ticket was successfully created.'
      else
        render :new
      end
    end

    def new
      @ticket = Ticket.new(params.slice(:train_id,:start_station_id,:end_station_id))
      # @ticket = Ticket.new(train_id: params[:train_id],
      #                      start_station_id: params[:start_station_id],
      #                      end_station_id: params[:end_station_id])
    end

    def index
      @tickets = Ticket.all
    end

    def edit
    end

    def update
      if @ticket.update(ticket_params)
        redirect_to [:admin, @ticket], notice: 'Ticket was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @ticket.destroy
      redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.'
    end

    private

    def ticket_params
      params.require(:ticket).permit(:user_id, :train_id, :start_station_id, :end_station_id, :passenger_name, :passenger_passport)
    end

    # def hidden_params
    #   @train = Train.find(params[:train_id])
    #   @start_station = RailwayStation.find(params[:start_station_id])
    #   @end_station = RailwayStation.find(params[:end_station_id])
    # end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  end
end
