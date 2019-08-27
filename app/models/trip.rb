class Trip < ApplicationRecord
  has_one :destination_board
  has_many :destinations, through: :destination_board
  delegate :winning_destination, to: :destination_board

  has_one :accommodation_board
  has_many :accommodations, through: :accommodation_board
  delegate :winning_accommodation, to: :accommodation_board

  has_one :timeframe_board
  has_many :timeframes, through: :timeframe_board
  delegate :winning_timeframe, to: :timeframe_board

  has_one :transportation_board
  has_many :transportations, through: :transportation_board
end
