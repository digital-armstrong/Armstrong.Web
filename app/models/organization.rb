class Organization < ApplicationRecord
  has_many :buildings
  has_many :divisions
  has_many :services

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "fax", "full_address", "id", "name", "phone", "updated_at", "zip_code"]
  end
end
