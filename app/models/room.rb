class Room < ApplicationRecord
  belongs_to :building

  has_many :devices
  has_many :control_point

  validates :name, :building, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['building_id', 'created_at', 'description', 'id', 'level', 'name', 'updated_at']
  end
end
