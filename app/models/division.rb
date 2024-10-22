class Division < ApplicationRecord
  belongs_to :organization

  has_many :services

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['created_at', 'id', 'name', 'organization_id', 'updated_at']
  end
end
