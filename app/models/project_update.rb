class ProjectUpdate < ApplicationRecord
  belongs_to :project

  validates :project, :title, :description, presence: true
end
