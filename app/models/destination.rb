class Destination < ApplicationRecord
  belongs_to :destination_board, foreign_key: :board_id
  belongs_to :user
end
