class Mission < ApplicationRecord
  belongs_to :user, optional: true
  validates :farm_id, presence: true, numericality: true
end
