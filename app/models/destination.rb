class Destination < ApplicationRecord
  belongs_to :board, optional: true
  belongs_to :user

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, length: { maximum: 300 }
end
