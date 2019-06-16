class Rhetoric < ApplicationRecord
  belongs_to :user
  has_many :picks, dependent: :destroy
end
