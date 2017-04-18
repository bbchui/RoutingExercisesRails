class Artwork < ApplicationRecord
  validates :image_url, presence: true
  validates :artist_id, presence: true
  validates :title, uniqueness: {scope: :artist_id}, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :view_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :view_shares,
    source: :viewer

  has_many :comments, dependent: :destroy,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment

  has_many :likes, as: :likeable

end
