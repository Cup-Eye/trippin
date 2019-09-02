class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  attr_accessor :email
end
