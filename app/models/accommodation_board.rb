class AccommodationBoard < Board
  has_many :accommodations,
           foreign_key: :board_id,
           class_name: "Accommodation",
           dependent: :destroy

  def winning_accommodation
    accommodations.where(winning: true).first
  end

  def check_status
    all_users = trip.participants.map { |participant| participant.user }
    all_voted = all_users.all? do |user|
      items = user.find_voted_items
      items.any? { |item| item.board == self }
    end
    status = all_voted ? 'Completed' : 'Incomplete'
    update(status: status)
  end
end
