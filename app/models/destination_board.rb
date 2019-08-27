class DestinationBoard < Board
  has_many :destinations,
           foreign_key: :board_id,
           class_name: "Destination",
           dependent: :destroy

  def winning_destination
    destinations.where(winning: true).first
  end
end
