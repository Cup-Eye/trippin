class Trip < ApplicationRecord
  has_many :boards

  # ========= BOARD CONVENIENCE METHODS ============

  # !!! Getters, NOT SETTERS !!!
  # !!! Set winner in a respective Board subclass. !!!

  # Destination helpers.

  def destination_board
    boards.where(type: "DestinationBoard").first
  end

  def destinations
    destination_board.destinations
  end

  def winning_destination
    boards.where.not(winning_destination_id: nil).first&.winning_destination
  end

  # Timeframe helpers

  def timeframe_board
    boards.where(type: "TimeframeBoard").first
  end

  def timeframes
    timeframe_board.timeframes
  end

  def winning_timeframe
    boards.where.not(winning_timeframe_id: nil).first&.winning_timeframe
  end
end
