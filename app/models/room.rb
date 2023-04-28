class Room < ApplicationRecord
  belongs_to :building

  has_many :channels
  has_many :devices

  validates :name, presence: true
end
