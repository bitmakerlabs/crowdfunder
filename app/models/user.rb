class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true

  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :backed_projects, :class_name => 'Project', through: :rewards, source: :project

  has_many :projects, foreign_key: :owner_id
end
