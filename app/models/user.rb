class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true

end
