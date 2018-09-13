class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 140 }

  validates :image, file_size: { less_than: 2.megabytes }
  mount_uploader :image, ImageUploader

  has_many :ingredients
  has_many :instructions

  accepts_nested_attributes_for :ingredients,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true

  accepts_nested_attributes_for :instructions,
                                reject_if: proc { |attributes| attributes['step'].blank? },
                                allow_destroy: true
end
