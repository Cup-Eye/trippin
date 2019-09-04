class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @user = User.find_by(email: participant_params[:email])
    @participant = Participant.new
    @trip = Trip.find(params[:trip_id])
    @participant.trip = @trip
    @participant.user = @user
    if @participant.save
      redirect_to new_trip_participant_path(@trip)
    else
      render :new
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    @trip = Trip.find(params[:trip_id])
    redirect_to new_trip_participant_path(@trip)
  end

  private

  def participant_params
    params.require(:participant).permit(:email)
  end
end
