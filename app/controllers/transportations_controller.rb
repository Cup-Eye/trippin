class TransportationsController < ApplicationController
  def index
    @board = Board.find(params[:transportation_board_id])
    @transportations = @board.transportations
    @boardD = Board.find_by(type: "DestinationBoard")
    @boardA = Board.find_by(type: "AccommodationBoard")
    @boardTf = Board.find_by(type: "TimeframeBoard")
  end

  def show
    @transportation = Transportation.find(params[:id])
  end

  def new
    @board = Board.find(params[:transportation_board_id])
    @transportation = Transportation.new
  end

  def create
    @transportation = Transportation.new(transportation_params)
    @board = Board.find(params[:transportation_board_id])
    @transportation.board = @board
    @transportation.user = current_user
    if @transportation.save
      redirect_to transportation_board_transportations_path(@board)
    else
      render :new
    end
  end

  def edit
    @transportation = Transportation.find(params[:id])
  end

  def update
    @transportation = Transportation.find(params[:id])
    @transportation.update(transportation_params)
    @transportation.user = current_user
    redirect_to transportation_board_transportations_path(@transportation.board)
  end

  def destroy
    @transportation = Transportation.find(params[:id])
    @transportation.destroy
    redirect_to transportation_board_transportations_path(@transportation.board)
  end

  private

  def transportation_params
    params.require(:transportation).permit(:route_number, :booking_number, :kind, :departure_time, :arrival_time, :departure_location, :arrival_location)
  end
end
