class CommentsController < ApplicationController
  before_action :set_board

  def create
    @comment = Comment.new(comment_params)
    @comment.board = @board
    @comment.user = current_user
    if @comment.save
      redirect_to redirection_path
    else
      render :new
    end
  end

  private

  def set_board
    if params[:accommodation_board_id].present?
      @board = Board.find(params[:accommodation_board_id])
    elsif params[:destination_board_id].present?
      @board = Board.find(params[:destination_board_id])
    elsif params[:transportation_board_id].present?
      @board = Board.find(params[:transportation_board_id])
    end
  end

  def redirection_path
    if @board.type == "AccommodationBoard"
      accommodation_board_accommodations_path(@board)
    elsif @board.type == "DestinationBoard"
      destination_board_destinations_path(@board)
    elsif @board.type == "TransportationBoard"
      transportation_board_transportations_path(@board)
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
