class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  def index
    @cars = type_class.all
  end

  def show
  end

  def new
    @car = type_class.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car, notice: "#{type} was successfully created."
    else
      render action: 'new'
    end
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: "#{type} was successfully created."
    else
      render action: 'edit'
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_type
    @type = type
  end
  def type
    Car.types.include?(params[:type]) ? params[:type] : "Car"
  end
  def type_class
    type.constantize
  end

  
  # Use callbacks to share common setup or conscarts between actions.
  def set_car
    @car = type_class.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def car_params
    params.require(type.underscore.to_sym).permit(:number, :type, :train_id, :top_places, :lower_places)
  end
end