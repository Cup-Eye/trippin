class Transportation < ApplicationRecord
  belongs_to :board, optional: true
  belongs_to :user

  validates :Route_number, presence: true
  validates :booking_number, presence: true
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :departure_location, presence: true
  validates :arrival_location, presence: true
  validates :kind, presence: true
end
