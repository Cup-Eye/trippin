class DestinationBoard < Board
  belongs_to :trip, inverse_of: :destination_board

  has_many :destinations, foreign_key: :board_id, class_name: "Destination", inverse_of: :destination_board
  belongs_to :winning_destination, class_name: "Destination", foreign_key: "winning_destination_id", optional: true

  def whoami
    puts "I am a destination board!"
  end
end
