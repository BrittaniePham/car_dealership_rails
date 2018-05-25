class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new #empty object in memory
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to car_path(@car.id)
    else
      render :new
    end
  end

  def edit
  end

  private
    def car_params
      params.require(:car).permit(:make, :model, :year, :color, :msrp, :used)
    end
end
