class Building < ApplicationRecord
  belongs_to :organization

  has_many :rooms
  has_many :services
  has_many :servers

  validates :name, presence: true
end
