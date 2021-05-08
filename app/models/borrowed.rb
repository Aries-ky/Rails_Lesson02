class Borrowed < ApplicationRecord

  validates :lodgment_start, presence: {}
  validates :lodgment_end, presence: {}
  validates :user, presence: {}

end
