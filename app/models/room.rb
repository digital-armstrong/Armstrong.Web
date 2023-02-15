class Room < ApplicationRecord
  belongs_to :building

  has_many :channels

  validates :name, presence: true
end
