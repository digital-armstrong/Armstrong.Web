require 'resolv'

class Server < ApplicationRecord
  belongs_to :service
  belongs_to :room

  has_many :channels

  validates :ip_adress,
            presence: true,
            uniqueness: true,
            format: { with: Resolv::IPv4::Regex }
end
