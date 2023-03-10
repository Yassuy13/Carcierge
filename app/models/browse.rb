class Browse < ApplicationRecord
  belongs_to :user
  belongs_to :post
  attachment :car_image
  validates :body, presence: true, length: { maximum: 1000 }
end
