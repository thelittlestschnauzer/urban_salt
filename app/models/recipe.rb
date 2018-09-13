class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 140 }

  validates :image, file_size: { less_than: 2.megabytes }

  mount_uploader :image, ImageUploader
end
