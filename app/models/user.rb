class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :inspections
  has_many :posts

  @email_regex = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  ROLES = {
    admin: 'admin',
    default: 'default',
    engineer: 'engineer',
    inspector: 'inspector',
    dosimetrist: 'dosimetrist',
  }

  validates :first_name, :last_name, presence: true
  validates :tabel_id, numericality: { less_than_or_equal_to: 2147483647 }, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: @email_regex }
  
  def self.ransackable_attributes(auth_object = nil)
    ["avatar_url", "created_at", "email", "encrypted_password", "first_name", "id", "last_name", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "second_name", "tabel_id", "updated_at"]
  end
  
  def admin?
    role == 'admin'
  end

  def default?
    role == 'default'
  end

  def engineer?
    role == 'engineer'
  end

  def inspector?
    role == 'inspector'
  end

  def dosimetrist?
    role == 'dosimetrist'
  end
end
