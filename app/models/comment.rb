class Comment < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
  validates :user_name, presence: true
  validates :body, presence: true
  validates :hotel_id, presence: true
end
