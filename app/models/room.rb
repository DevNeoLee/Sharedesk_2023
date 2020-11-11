class Room < ApplicationRecord
  belongs_to :user
  has_many_attached :images 
  has_many :reservations
  geocoded_by :address
  has_many :reviews

  validates :home_type, presence: true
  validates :room_type, presence: true 
  validates :accomodate, presence: true 
  validates :bed_room, presence: true 
  validates :bath_room, presence: true 
  validates :listing_name, presence: true, length: { maximum: 50}
  validates :summary, presence: true, length: { maximum: 500}
  validates :address, presence: true

  def average_rating 
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end


  def default_room
    if avatar.attached?
      avatar
    else 
      'default_avatar.png'
    end
  end

end
