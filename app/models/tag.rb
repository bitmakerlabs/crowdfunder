class Tag < ApplicationRecord
  has_and_belongs_to_many :projects

  def self.search(search)
    find_by('name ILIKE ?', "%#{search}%")
  end

end
