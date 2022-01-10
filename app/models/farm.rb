class Farm < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :address
end
