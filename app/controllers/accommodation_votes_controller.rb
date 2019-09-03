class AccommodationVotesController < ApplicationController
  def create
    @accommodation = Accommodation.find(params[:accommodation_id])
    @accommodation.liked_by current_user
    redirect_to accommodation_board_accommodations_path(@accommodation.board)
  end

  def destroy
    @accommodation = Accommodation.find(params[:accommodation_id])
    @accommodation.unliked_by current_user
    redirect_to accommodation_board_accommodations_path(@accommodation.board)
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:url, :name, :kind, :address, :price)
  end
end
