class Activity < ApplicationRecord
  belongs_to :tank
  validates :intervention, presence: true
end
