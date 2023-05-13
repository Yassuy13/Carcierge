class Browse < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one_attached :image
  validates :body, presence: true, length: { maximum: 1000 }
end
