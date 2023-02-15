class Manufacturer < ApplicationRecord
  @email_regex = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  has_many :device_models

  validates :name, presence: true
  validates :email,
            format: { with: @email_regex }
end
