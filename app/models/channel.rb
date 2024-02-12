class Channel < ApplicationRecord
  belongs_to :server
  belongs_to :service

  has_many :history
  belongs_to :control_point
end
