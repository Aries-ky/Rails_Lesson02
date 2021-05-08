class User < ApplicationRecord
  #Passのハッシュ化をさせてないので不使用
  #has_secure_password
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader

  validates :name, presence: {}
  validates :pass, presence: {}
  validates :mail, presence: {}

end
