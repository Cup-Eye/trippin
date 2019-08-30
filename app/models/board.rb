class Board < ApplicationRecord
  belongs_to :trip

  def name
    type.gsub("Board", "")
  end
end
