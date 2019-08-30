class Timeframe < ApplicationRecord
  belongs_to :board, optional: true
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, length: { maximum: 100 }
end
