class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :creator_inspections, class_name: 'Inspection', foreign_key: 'creator_id'
  has_many :performer_inspections, class_name: 'Inspection', foreign_key: 'performer_id'

  @email_regex = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  validates :first_name, :last_name, presence: true
  validates :tabel_id, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: @email_regex }
end
