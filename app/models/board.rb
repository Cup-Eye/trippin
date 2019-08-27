class Board < ApplicationRecord
  has_many :destinations, dependent: :destroy, class_name: "Destination"
  has_many :accommodations, dependent: :destroy, class_name: "Accommodation"
  has_many :timeframes, dependent: :destroy, class_name: "Timeframe"
  # has_many :transportations, dependent: :destroy, class_name: "Transportation"
end
