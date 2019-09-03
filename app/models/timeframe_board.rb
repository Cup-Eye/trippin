class TimeframeBoard < Board
  has_many :timeframes,
           foreign_key: :board_id,
           class_name: "Timeframe",
           dependent: :destroy

  def winning_timeframe
    timeframes.where(winning: true).first
  end

  def check_status
    all_users = trip.participants.map { |participant| participant.user }
    all_participated = all_users.all? do |user|
      items = user.timeframes.present?
    end
    status = all_participated ? 'Completed' : 'Incomplete'
    update(status: status)
  end
end
