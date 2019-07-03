class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :rhetorics, dependent: :destroy
  has_many :picks, dependent: :destroy
  # has_many :pick_rhetorics, through: :picks, source: :rhetoric
  has_many :comments,dependent: :destroy


  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    validates :name, presence: true #追記
    validates :profile, length: { maximum: 200 } #追記

    unless user
      user = User.create(
          uid:      auth.uid,
          provider: auth.provider,
          email:    User.dummy_email(auth),
          password: Devise.friendly_token[0, 20]
      )
    end

    user
  end


  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
