class Hotel < ActiveRecord::Base
belongs_to :user
has_many :comments, dependent: :destroy
has_many :votes, dependent: :destroy
scope :top5, -> {
    select("hotels.id, hotels.title, hotels.star_rating, hotels.breakfast,
     hotels.image, hotels.room_desc, hotels.price, hotels.address,count(votes) AS votes_count").
    joins(:votes).
    group("hotels.id, hotels.title, hotels.star_rating,
     hotels.breakfast, hotels.image, hotels.room_desc, hotels.price, hotels.address").
    order("votes_count DESC").
    limit(5)
}
#Hotel.top5
validates :title, presence: true, length: {minimum:2, maximum:30}
VALID_BREAK_REGEX = /\A+\d/
#validates :breakfast, presence: true, format: {with:VALID_BREAK_REGEX}
validates :star_rating, presence: true, format: {with: /\A+[1-5]/}
validates :room_desc, presence: true
validates :price, presence: true, format: {with:VALID_BREAK_REGEX}
validates :address, presence: true
validates :image, presence: true
mount_uploader :image, ImageUploader
end
