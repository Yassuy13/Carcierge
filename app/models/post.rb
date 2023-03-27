class Post < ApplicationRecord
  belongs_to :user
  has_many :browses, dependent: :destroy
  belongs_to :category
  attachment :car_image
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 3000 }
end
