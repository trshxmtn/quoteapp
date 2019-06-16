class Pick < ApplicationRecord
  belongs_to :user
  belongs_to :rhetoric

  validates :user_id, presence: true
  validates :rhetoric_id, presence: true
end
