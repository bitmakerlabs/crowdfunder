class User < ActiveRecord::Base

  has_many :projects
  has_many :pledges
  has_many :backed_projects, through: :pledges, source: :project

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  has_secure_password
  validates :email, uniqueness: true

  def full_name
    return "#{first_name} #{self.last_name}"
  end

end
