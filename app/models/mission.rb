class Mission < ApplicationRecord
  belongs_to :user, optional: true
  validates_presence_of :user_id
  validates_presence_of :farm_id
end
