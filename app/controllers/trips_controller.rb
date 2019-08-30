class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @boards = @trip.boards
    @user = @trip.user
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    @trip.user = current_user
    redirect_to trip_boards_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @user = current_user
    @trip.destroy
    raise
    redirect_to dashboard_path(@user)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :destination, :start_date, :end_date, :photo)
  end
end
