class Timeframe < ApplicationRecord
  belongs_to :timeframe_board, optional: true
  belongs_to :user
end
