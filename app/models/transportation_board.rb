class TransportationBoard < Board
  has_many :transportations,
           foreign_key: :board_id,
           class_name: "Transportation",
           dependent: :destroy

  def check_status
    all_users = trip.participants.map { |participant| participant.user }
    all_participated = all_users.all? do |user|
      items = user.transportations.present?
    end
    status = all_participated ? 'Completed' : 'Incomplete'
    update(status: status)
  end
end
