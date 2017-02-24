class Update < ApplicationRecord
    belongs_to :project
    belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
end
