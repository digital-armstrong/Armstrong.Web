class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  belongs_to :service

  has_many :inspections
  has_many :posts

  @email_regex = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i

  ROLES = {
    admin: 'admin',
    default: 'default',
    engineer: 'engineer',
    inspector: 'inspector',
    dosimetrist: 'dosimetrist',
  }.freeze

  validates :first_name, :last_name, presence: true
  validates :tabel_id, numericality: { less_than_or_equal_to: 2147483647 }, presence: true, uniqueness: true
  validate  :validate_tabel_id
  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, minimum: 6, allow_blank: true
  validate :validate_email

  def self.ransackable_attributes(_auth_object = nil)
    ['avatar_url', 'created_at', 'email', 'encrypted_password', 'first_name', 'id', 'last_name', 'phone', 'remember_created_at',
     'reset_password_sent_at', 'reset_password_token', 'role', 'second_name', 'tabel_id', 'updated_at', 'service_id']
  end

  def self.ransackable_associations(_auth_object = nil)
    ['inspections', 'posts']
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

  protected

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    false
  end

  def validate_email
    if !email.blank? && !email.match(/\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i)
      errors.add(:email, "Doesn't match email pattern")
    end
  end

  def validate_tabel_id
    if tabel_id.to_i.between?(1, 100) && role != User::ROLES[:admin]
      errors.add(:tabel_id, "is reserved for #{User::ROLES[:admin]}")
    end
  end
end
