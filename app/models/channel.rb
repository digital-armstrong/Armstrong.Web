class Channel < ApplicationRecord
  belongs_to :device
  belongs_to :room
  belongs_to :server
  belongs_to :service
end
