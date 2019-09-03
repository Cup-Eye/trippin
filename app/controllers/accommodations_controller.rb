class AccommodationsController < ApplicationController
  def index
    @board = Board.find(params[:accommodation_board_id])
    @trip = @board.trip
    @accommodations = @board.accommodations.sort_by {|accommodation| - accommodation.votes_for.size }
    @comment = Comment.new
    @board.comments

    @accommodations = Accommodation.geocoded

    @markers = @accommodations.map do |acc|
      {
        lat: acc.latitude,
        lng: acc.longitude,
        accommodation_id: acc.id
      }
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
  end

  def new
    @board = Board.find(params[:accommodation_board_id])
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accomm_params)
    @board = Board.find(params[:accommodation_board_id])
    @accommodation.board = @board
    @accommodation.user = current_user
    if @accommodation.save
      redirect_to accommodation_board_accommodations_path(@board)
    else
      render :new
    end
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    @accommodation.update(accomm_params)
    @accommodation.user = current_user
    redirect_to accommodation_board_accommodations_path(@accommodation.board)
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy
    redirect_to accommodation_board_accommodations_path(@accommodation.board)
  end

  private

  def accomm_params
    params.require(:accommodation).permit(:url, :name, :kind, :address, :price)
  end
end
