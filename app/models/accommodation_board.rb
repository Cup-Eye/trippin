class AccommodationBoard < Board
  has_many :accommodations,
           foreign_key: :board_id,
           class_name: "Accommodation",
           dependent: :destroy

  def winning_accommodation
    accommodations.where(winning: true).first
  end
end
