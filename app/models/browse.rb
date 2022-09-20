class Browse < ApplicationRecord
  belongs_to :user
  belongs_to :post
  attachment :car_image_id
end
