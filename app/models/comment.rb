class Comment < ApplicationRecord
  belongs_to :board, dependent: :destroy
  belongs_to :user
  validates :content, presence: true
end
