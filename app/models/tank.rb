class Tank < ApplicationRecord
  has_many :activities
  validates :tank_name, presence: true
  validates :quantity, presence: true
  validates :quantity_max, presence: true
end
