class Rhetoric < ApplicationRecord
  belongs_to :user
  belongs_to :speaker
  validates :user_id, presence: true
  has_many :picks, dependent: :destroy
  has_many :pick_users, through: :picks, source: :user
  has_many :comments,dependent: :destroy
<<<<<<< HEAD
  # has_many :rhetoric_speakers,dependent: :destroy

  def save_speakers(speakers)
    current_speakers = self.speakers.pluck(:name) unless self.speakers.nil?
    old_speakers = current_speakers - speakers
    new_speakers = speakers - current_speakers

    #古いタグを削除
    old_speakers.each do |old_name|
=======
  has_many :rhetoric_speakers,dependent: :destroy
  has_many :speakers,through: :rhetoric_speakers


  def save_speakers(tags)
    current_tags = self.speakers.pluck(:mame) unless self.speakers.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    #古いタグを削除
    old_tags.each do |old_name|
>>>>>>> develop
      self.speakers.delete Speaker.find_by(name: old_name)
    end

    #新しいタグを作成
<<<<<<< HEAD
    new_speakers.each do |new_name|
      rhetoric_speaker = Speaker.find_or_create_by(name: new_name)
=======
    new_tags.each do |new_name|
      rhetoric_speaker = Speaker.find_by(name: new_name)
>>>>>>> develop
      self.speakers << rhetoric_speaker
    end

  end
end
