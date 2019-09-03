class DestinationVotesController < ApplicationController
  def create
    @destination = Destination.find(params[:destination_id])
    if @destination.board.destinations.count == 1
      @destination.liked_by current_user
      redirect_to destination_board_destinations_path(@destination.board)
    elsif current_user.get_voted(Destination).size == @destination.board.destinations.count - 1
      @destination.liked_by current_user
      redirect_to destination_board_destinations_path(@destination.board)
    else
      flash[:alert] = "Sorry, you cannot chose all options!"
      redirect_to destination_board_destinations_path(@destination.board)
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @destination.unliked_by current_user
    redirect_to destination_board_destinations_path(@destination.board)
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :description)
  end
end
