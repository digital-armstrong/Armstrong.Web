class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  def formatted_date (param)
    param.strftime('%d.%m.%Y %H:%M:%S')
  end

  def self.ransackable_attributes(_auth_object = nil)
    ['body', 'category', 'created_at', 'id', 'title', 'updated_at', 'user_id']
  end
end
