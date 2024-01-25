class Room < ApplicationRecord
  belongs_to :building

  has_many :devices
  has_many :control_point

  validates :name, presence: true
end
