class Speaker < ApplicationRecord
  validates :name,presence: true, length: {maximum: 50}
<<<<<<< HEAD
  # has_many :rhetoric_speakers,dependent: :destroy
  has_many :rhetorics
=======
  has_many :rhetoric_speakers,dependent: :destroy
  has_many :rhetorics, through: :rhetoric_speakers

>>>>>>> develop
end
