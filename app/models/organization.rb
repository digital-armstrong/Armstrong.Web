class Organization < ApplicationRecord
  has_many :buildings
  has_many :divisions
  has_many :services

  validates :name, presence: true
end
