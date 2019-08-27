class Accommodation < ApplicationRecord
  belongs_to :accommodation_board, foreign_key: :board_id
  belongs_to :user
end
