class DestinationBoard < Board
  has_many :destinations,
           foreign_key: :board_id,
           class_name: "Destination",
           dependent: :destroy

  def winning_destination
    destinations.where(winning: true).first
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
