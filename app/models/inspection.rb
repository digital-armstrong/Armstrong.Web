class Inspection < ApplicationRecord
  belongs_to :user
  belongs_to :device

  validates :user, presence: true
end
