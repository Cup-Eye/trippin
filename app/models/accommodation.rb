class Accommodation < ApplicationRecord
  acts_as_votable
  belongs_to :board, optional: true
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  # validates :url, presence: true, uniqueness: true
  # validates :address, presence: true, length: { maximum: 100 }
  validates :price, presence: true, length: { maximum: 10 }
  validates :kind, presence: true
end
