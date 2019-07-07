class RhetoricSpeaker < ApplicationRecord
<<<<<<< HEAD
  # belongs_to :speaker
  # belongs_to :rhetoric
  # validates :speaker_id,presence: true
  # validates :rhetoric_id,presence: true
=======
  belongs_to :speaker
  belongs_to :rhetoric
  validates :speaker_id,presence: true
  validates :rhetoric_id,presence: true
>>>>>>> develop
end
