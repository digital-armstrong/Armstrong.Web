class Inspection < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :performer, class_name: 'User'
  belongs_to :device

  def self.ransackable_attributes(_auth_object = nil)
    ['conclusion', 'conclusion_date', 'created_at', 'creator_id', 'description', 'device_id', 'id', 'performer_id', 'state', 'updated_at']
  end
end
