class Room < ApplicationRecord
  belongs_to :building

  has_many :channels
  has_many :devices
  has_many :control_points

  validates :name, presence: true
end
