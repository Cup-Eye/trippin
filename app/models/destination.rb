class Destination < ApplicationRecord
  acts_as_votable
  belongs_to :board, optional: :true
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: { scope: :board }, length: { minimum: 3 }
  validates :description, length: { maximum: 300 }
end
