class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  validates :user, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :body, presence: true, length: { minimum: 200, maximum: 4000 }

  scope :latest, -> { order(created_at: :desc) }

  def formatted_date(param)
    I18n.l(param, format: :long)
  end

  def self.ransackable_attributes(_auth_object = nil)
    ['body', 'category', 'created_at', 'id', 'title', 'updated_at', 'user_id']
  end
end
