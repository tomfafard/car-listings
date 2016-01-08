class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      flash[:success] = "Car added successfully"
      redirect_to cars_path
    else
      flash[:warning] = @car.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer_id, :color, :year, :mileage)
  end
end
