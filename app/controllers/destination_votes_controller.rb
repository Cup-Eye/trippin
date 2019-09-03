class DestinationVotesController < ApplicationController
  def create
    # Get the destination (find)
    @destination = Destination.find(params[:destination_id])
    # current user like destination
    @destination.liked_by current_user
    # redirect to the destinatation board
    redirect_to destination_board_destinations_path(@destination.board)
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
