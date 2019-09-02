class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  has_many :trips, dependent: :nullify
  has_many :comments

  has_many :destinations, dependent: :nullify
  has_many :accommodations, dependent: :nullify
  has_many :timeframes, dependent: :nullify
  has_many :transportations, dependent: :nullify
end
