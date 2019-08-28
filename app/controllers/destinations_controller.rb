class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination_board = destination_board.find(params[:board_id])
    @destination = Destination.new(destination_params)
    @destination.destination_board = @destination_board
    @destination.user = current_user
    if @destinations.save
      redirect_to trip_destinations_path #trip_boards_path(@trip)
    else
      render :new
    end
  end

  # def edit
  #   @destination = Destination.find(params[:id])
  # end

  # def update
  #   @destination = Destination.find(params[:id])
  #   @destination.update(destination_params)
  #   @destination.user = current_user
  #   redirect_to trip_destinations_path #trip_boards_path(@trip)
  # end

  # def destroy
  #   @destination = Destination.find(params[:id])
  #   @destination.destroy
  #   redirect_to trip_destinations_path
  # end

  # private

  # def destinations_params
  #   params.require(:destination).permit(:name, :description)
  # end
end
