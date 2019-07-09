class Speaker < ApplicationRecord
  validates :name,presence: true, length: {maximum: 50}
  # has_many :rhetoric_speakers,dependent: :destroy
  has_many :rhetorics
end
