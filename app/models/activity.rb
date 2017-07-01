class Activity < ApplicationRecord
  belongs_to :tank
  validates :intervention, presence: true
  validates :activity_id, presence: true
end
