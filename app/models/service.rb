class Service < ApplicationRecord
  belongs_to :division
  belongs_to :organization
  belongs_to :building

  has_many :devices
  has_many :users
  has_many :servers
  has_many :control_points
end
