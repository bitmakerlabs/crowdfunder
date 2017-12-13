class User < ActiveRecord::Base
  has_many :comments
  has_many :projects
  has_and_belongs_to_many :rewards
  has_secure_password


  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
