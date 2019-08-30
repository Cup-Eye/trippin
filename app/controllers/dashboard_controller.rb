class DashboardController < ApplicationController
  def show
    @trips = Trip.where(user_id: current_user.id)
  end
end
