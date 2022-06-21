class Micropost < ApplicationRecord
  belongs_to :user, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
