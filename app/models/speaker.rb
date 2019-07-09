class Speaker < ApplicationRecord
  validates :name,presence: true, length: {maximum: 50}
  belongs_to :rhetoric
end
