class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :projects
  has_many :pledges

  validates :password_confirmation, presence: true, on: :create
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create

end
