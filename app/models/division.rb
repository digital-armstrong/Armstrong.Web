class Division < ApplicationRecord
  belongs_to :organization

  has_many :services

  validates :name, presence: true
end
