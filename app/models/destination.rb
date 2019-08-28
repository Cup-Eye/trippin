class Destination < ApplicationRecord
  belongs_to :board, optional: :true
  belongs_to :user
end
