class Timeframe < ApplicationRecord
  belongs_to :board, optional: true
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, length: { maximum: 100 }
  validate :cannot_overlap_another_timeframe


  def cannot_overlap_another_timeframe
    condition_on_create = user.timeframes.where('start_date <= ?', start_date).where('end_date >= ?', start_date).any? ||
      user.timeframes.where('start_date <= ?', end_date).where('end_date >= ?', end_date).any?
    condition_on_update = user.timeframes.where('start_date <= ?', start_date).where('end_date >= ?', start_date).where.not(id: id).any? ||
      user.timeframes.where('start_date <= ?', end_date).where('end_date >= ?', end_date).where.not(id: id).any?
    if persisted? ? condition_on_update : condition_on_create
      errors.add(:start_date, "overlaps another timeframe")
    end
  end
end
2
