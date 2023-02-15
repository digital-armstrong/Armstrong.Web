require 'resolv'

class Server < ApplicationRecord
  @ip_regex = /^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/

  belongs_to :service
  belongs_to :room

  has_many :channels

  validates :ip_adress,
            presence: true,
            uniqueness: true,
            format: { with: Resolv::IPv4::Regex }
end
