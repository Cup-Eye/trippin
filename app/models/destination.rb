class Destination < ApplicationRecord
  belongs_to :board # #board
  belongs_to :user
end
