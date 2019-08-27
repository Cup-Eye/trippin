class Accommodation < ApplicationRecord
  belongs_to :accommodation_board, optional: true
  belongs_to :user
end
