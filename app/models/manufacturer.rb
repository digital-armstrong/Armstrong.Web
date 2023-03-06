class Manufacturer < ApplicationRecord
  @email_regex = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  has_many :device_models

  validates :name, presence: true
  validates :email,
            format: { with: @email_regex }

  def self.ransackable_attributes(_auth_object = nil)
    ['adress', 'created_at', 'email', 'id', 'name', 'phone', 'site_url', 'updated_at']
  end
end
