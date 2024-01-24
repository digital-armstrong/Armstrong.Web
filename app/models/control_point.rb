class ControlPoint < ApplicationRecord
  belongs_to :room
  belongs_to :channel
  belongs_to :device

  validates :name, presence: true
end
