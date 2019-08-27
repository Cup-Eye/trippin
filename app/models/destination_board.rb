class DestinationBoard < Board
  has_many :destinations, foreign_key: :board_id, class_name: "Destination"
  belongs_to :winning_destination, class_name: "Destination", foreign_key: "winning_destination_id", optional: true

  def whoami
    puts "I am a destination board!"
  end
end
