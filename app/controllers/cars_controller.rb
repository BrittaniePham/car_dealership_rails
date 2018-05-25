class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new #rails knows it's a POST in the form if there is no id
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
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to cars_path
    else
      render :edit
    end
  end

  def destroy
    Car.find(params[:id]).destroy
    redirect_to cars_path
  end

  private
    def car_params
      params.require(:car).permit(:make, :model, :year, :color, :msrp, :used)
    end
end
