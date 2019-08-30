class DashboardController < ApplicationController
  def show
    @trips = Trip.where(user_id: current_user.id)
  end

  def destroy
    @user = current_user
    @trip = Trip.find(params[@user.trip_id])
    # @user = current_user
    # raise
    @trip.destroy
    @trip.user = current_user
    redirect_to dashboard_path(@trip.user)
  end
end
