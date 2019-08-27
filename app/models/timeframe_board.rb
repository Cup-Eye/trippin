class TimeframeBoard < Board
  has_many :timeframes, foreign_key: :board_id, class_name: "Timeframe"
  belongs_to :winning_timeframe, class_name: "Timeframe", foreign_key: "winning_timeframe_id", optional: true
end
