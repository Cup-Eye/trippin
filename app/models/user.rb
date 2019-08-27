class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :destinations, dependent: :destroy
  has_many :accommodations, dependent: :destroy
  has_many :timeframes, dependent: :destroy
  has_many :transportations, dependent: :destroy
end
