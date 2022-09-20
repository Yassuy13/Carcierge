class Post < ApplicationRecord
  belongs_to :user
  has_many :browses, dependent: :destroy
  attachment :car_image_id
end
