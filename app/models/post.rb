class Post < ApplicationRecord
  belongs_to :user
  attachment :car_image
end
