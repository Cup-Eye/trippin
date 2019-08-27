class Timeframe < ApplicationRecord
  belongs_to :board # #board
  belongs_to :user
end
