class TimeframesController < ApplicationController
  def index
    @timeframes = Timesframe.all
  end

  def new
    @timeframe = Timeframe.new
  end

  def create
    @timeframe = Timeframe.new(timeframe_params)
    @timeframe.user = current_user
    if @timeframe.save
      redirect_to trip_timeframes_path
    else
      render :new
    end
  end

  def edit
    @timeframe = Timeframe.find(params[:id])
  end

  def update
    @timeframe = Timeframe.find(params[:id])
    @timeframe.update(timeframe_params)
    redirect_to trip_timeframes_path
  end

  def destroy
    @timeframe = Timeframe.find(params[:id])
    @timeframe.destroy(timeframe_params)
    redirect_to trip_timeframes_path
  end

  private

  def timeframe_params
    params.require(:timeframe).permit(:start_date, :end_date)
  end
end
