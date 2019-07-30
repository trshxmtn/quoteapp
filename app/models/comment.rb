class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :rhetoric

  validates :content, presence: true
end
