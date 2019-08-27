class AccommodationBoard < Board
  has_many :accommodations, foreign_key: :board_id, class_name: "Accommodation"
  belongs_to :winning_accommodation, class_name: "Accommodation", foreign_key: "winning_accommodation_id", optional: true

  def whoami
    puts "I am an accommodation board!"
  end
end
