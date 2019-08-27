class TimeframeBoard < Board
  has_many :timeframes,
           foreign_key: :board_id,
           class_name: "Timeframe",
           dependent: :destroy

  def winning_timeframe
    timeframes.where(winning: true).first
  end
end
