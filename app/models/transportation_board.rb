class TransportationBoard < Board
  has_many :transportations, foreign_key: :board_id, class_name: "Transportation"
end
