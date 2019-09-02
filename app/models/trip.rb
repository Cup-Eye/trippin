class Trip < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy
  validates :name, presence: true

  mount_uploader :photo, PhotoUploader

  has_one :destination_board, dependent: :destroy
  # NOTE!!! Cannot do trip.destinations << destination
  # INSTEAD do trip.destination_board.destinations << destination
  has_many :destinations, through: :destination_board
  delegate :winning_destination, to: :destination_board

  has_one :accommodation_board, dependent: :destroy
  has_many :accommodations, through: :accommodation_board
  delegate :winning_accommodation, to: :accommodation_board

  has_one :timeframe_board, dependent: :destroy
  has_many :timeframes, through: :timeframe_board
  delegate :winning_timeframe, to: :timeframe_board

  has_one :transportation_board, dependent: :destroy
  has_many :transportations, through: :transportation_board

  after_commit :create_four_boards, on: :create
  after_commit :create_participant_for_admin, on: :create

  def boards
    [accommodation_board, destination_board, timeframe_board, transportation_board]
  end

  def winning_destination=(destination)
    destinations.each do |dest|
      if dest == destination
        dest.update(winning: true)
      else
        dest.update(winning: false)
      end
    end
  end

  def winning_accommodation=(accommodation)
    accommodations.each do |acc|
      if acc == accommodation
        acc.update(winning: true)
      else
        acc.update(winning: false)
      end
    end
  end

  def winning_timeframe=(timeframe)
    timeframes.each do |time|
      if time == timeframe
        time.update(winning: true)
      else
        time.update(winning: false)
      end
    end
  end

  def active_users
    ids = (destinations.pluck(:user_id) +
          accommodations.pluck(:user_id) +
          transportations.pluck(:user_id) +
          timeframes.pluck(:user_id)).uniq
    User.where(id: ids)
  end

  private

  def create_participant_for_admin
    Participant.create(trip: self, user: user)
  end

  def create_four_boards
    create_timeframe_board(status: "incomplete", description: "Find the most suitable dates!")
    create_destination_board(status: "incomplete", description: "Decide where you wanna go!")
    create_transportation_board(status: "incomplete", description: "Coordinate your travels!")
    create_accommodation_board(status: "incomplete", description: "Discover the perfect place to stay!")
  end
end
