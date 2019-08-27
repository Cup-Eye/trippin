class Transportation < ApplicationRecord
  belongs_to :transportation_board, optional: true
  belongs_to :user
end
