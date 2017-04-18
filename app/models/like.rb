class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :likeable_id, :likeable_type, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :likeable, polymorphic: true



end
