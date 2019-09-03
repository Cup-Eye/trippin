class TimeframesController < ApplicationController
  def index
    @board = Board.find(params[:timeframe_board_id])
    @timeframes = @board.timeframes
    @trip = @board.trip
    if @timeframes.any?
      @earliest_date = @timeframes.order(start_date: :asc).first.start_date
      @last_date = @timeframes.order(end_date: :desc).first.end_date
      @total_dates = (@last_date - @earliest_date).to_i + 1
      @first_day_grid = @timeframes.order(start_date: :asc).first.start_date
    end
  end

  def show
    @timeframe = Timeframe.find(params[:id])
  end

  def new
    @board = Board.find(params[:timeframe_board_id])
    @timeframe = Timeframe.new
  end

  def create
    @timeframe = Timeframe.new(timeframe_params)
    @board = Board.find(params[:timeframe_board_id])
    @timeframe.board = @board
    @timeframe.user = current_user
    if @timeframe.save
      redirect_to timeframe_board_timeframes_path(@board)
    else
      flash[:alert] = "Timeframes cannot overlap!"
      render :new
    end
  end

  def edit
    @timeframe = Timeframe.find(params[:id])
  end

  def update
    @timeframe = Timeframe.find(params[:id])
    @timeframe.update(timeframe_params)
    @timeframe.user = current_user
    if @timeframe.save
      redirect_to timeframe_board_timeframes_path(@timeframe.board)
    else
      flash[:alert] = "Timeframes cannot overlap!"
      render :edit
    end
  end

  def destroy
    @timeframe = Timeframe.find(params[:id])
    @timeframe.destroy
    redirect_to timeframe_board_timeframes_path(@timeframe.board)
  end

  private

  def timeframe_params
    params.require(:timeframe).permit(:start_date, :end_date, :description)
  end
end
