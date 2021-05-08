class Rental < ApplicationRecord
  belongs_to :rental, optional: true
  mount_uploader :image, ImageUploader

  validates :title, presence: {}
  validates :price, presence: {}
  validates :max_user, presence: {}
  validates :description, presence: {}
  validates :Aria, presence: {}
  validates :address, presence: {}

end
