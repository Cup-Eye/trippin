class AccommodationVotesController < ApplicationController
  def create
    @accommodation = Accommodation.find(params[:accommodation_id])
    if @accommodation.board.accommodations.count == 1 ||
       current_user.get_voted(Accommodation).size < @accommodation.board.accommodations.count - 1
      @accommodation.liked_by current_user
      @accommodation.board.check_status
    else
      flash[:alert] = "Sorry, you cannot chose all options!"
    end
    redirect_to accommodation_board_accommodations_path(@accommodation.board)
  end

  def destroy
    @accommodation = Accommodation.find(params[:accommodation_id])
    @accommodation.unliked_by current_user
    @accommodation.board.check_status
    redirect_to accommodation_board_accommodations_path(@accommodation.board)
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:url, :name, :kind, :address, :price)
  end
end
