class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips, dependent: :nullify

  has_many :destinations, dependent: :nullify
  has_many :accommodations, dependent: :nullify
  has_many :timeframes, dependent: :nullify
  has_many :transportations, dependent: :nullify
end
