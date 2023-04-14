class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :inspections
  has_many :posts

  @email_regex = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  ROLES = {
    :admin => 'admin',
    :default => 'default',
    :engineer => 'engineer',
    :inspector => 'inspector',
    :dosimetrist => 'dosimetrist' }

  validates :first_name, :last_name, presence: true
  validates :tabel_id, numericality: { less_than_or_equal_to: 2147483647 }, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: @email_regex }
end
