class DashboardController < ApplicationController
  def show
    @participants = current_user.participants
  end
end
