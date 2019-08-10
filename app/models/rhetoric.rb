class Rhetoric < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :meigen, presence: true
  has_many :picks, dependent: :destroy
  has_many :pick_users, through: :picks, source: :user
  has_many :comments,dependent: :destroy
  acts_as_taggable
  # アップローダー紐づけ
  mount_uploader :image, RhetoricImageUploader #OGPの全体写真
  mount_uploader :picture, RhetoricPictureUploader #投稿の画像

  def pick(user)
    picks.create(user_id: user.id)
  end

  def unpick(user)
    picks.find_by(user_id: user.id).destroy
  end

  def pick?(user)
    pick_users.include?(user)
  end

end
