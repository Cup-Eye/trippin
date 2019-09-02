class Board < ApplicationRecord
  belongs_to :trip
  has_many :comments, foreign_key: :board_id, class_name: "Comment"

  def name
    type.gsub("Board", "")
  end
end
