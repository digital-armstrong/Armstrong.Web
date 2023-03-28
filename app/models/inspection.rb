class Inspection < ApplicationRecord
  belongs_to :user
  belongs_to :device

  validates :user, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['assigned_user_id', 'conclusion', 'conclusion_date', 'created_at', 'creator_id', 'description', 'device_id', 'id', 'state',
     'updated_at']
  end
end
