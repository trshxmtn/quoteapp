class Rhetoric < ApplicationRecord
  belongs_to :user
  belongs_to :speaker
  validates :user_id, presence: true
  has_many :picks, dependent: :destroy
  has_many :pick_users, through: :picks, source: :user
  has_many :comments,dependent: :destroy
  has_many :rhetoric_speakers,dependent: :destroy
  has_many :speakers,through: :rhetoric_speakers


  def save_speakers(tags)
    current_tags = self.speakers.pluck(:mame) unless self.speakers.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    #古いタグを削除
    old_tags.each do |old_name|
      self.speakers.delete Speaker.find_by(name: old_name)
    end

    #新しいタグを作成
    new_tags.each do |new_name|
      rhetoric_speaker = Speaker.find_by(name: new_name)
      self.speakers << rhetoric_speaker
    end

  end
end
