class DestinationsController < ApplicationController
  def index
    @board = Board.find(params[:destination_board_id])
    @trip = @board.trip
    @destinations = @board.destinations.sort_by {|destination| - destination.votes_for.size }
    @comment = Comment.new
    @board.comments

  end

  def new
    @board = Board.find(params[:destination_board_id])
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    @board = Board.find(params[:destination_board_id])
    @destination.board = @board
    @destination.user = current_user
    if @destination.save
      redirect_to destination_board_destinations_path(@board)
    else
      render :new
    end
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    @destination.user = current_user
    redirect_to destination_board_destinations_path(@destination.board)
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    @destination.board.check_status
    redirect_to destination_board_destinations_path(@destination.board)
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :description, :winning)
  end
end
