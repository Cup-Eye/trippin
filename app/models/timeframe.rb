class Timeframe < ApplicationRecord
  belongs_to :timeframe_board, foreign_key: :board_id
  belongs_to :user
end
