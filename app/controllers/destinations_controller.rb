class DestinationsController < ApplicationController
  def index
    @destination = Destination.new
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
    @board = Board.where(type: "DestinationBoard", trip_id: params[:trip_id])
    @destination_board_id = board.first
    @destination.user = current_user
    @destination = Destination.new
    if @destinations.save
      redirect_to trip_destinations_path(@board.trip)
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
