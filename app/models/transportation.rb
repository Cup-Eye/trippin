class Transportation < ApplicationRecord
  belongs_to :board, optional: true
  belongs_to :user

  validates :route_number, presence: true, length: { maximum: 15 }
  validates :booking_number, presence: true, length: { maximum: 15 }
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :departure_location, presence: true, length: { maximum: 25 }
  validates :arrival_location, presence: true, length: { maximum: 25 }
  validates :kind, presence: true
end
