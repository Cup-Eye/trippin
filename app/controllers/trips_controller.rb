class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(id)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trips_path #trip_boards_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    @trip.user = current_user
    redirect_to trips_path #trip_boards_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :destination, :start_date, :end_date)
  end
end
