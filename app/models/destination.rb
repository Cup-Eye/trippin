class Destination < ApplicationRecord
  belongs_to :destination_board, optional: :true
  belongs_to :user
end
