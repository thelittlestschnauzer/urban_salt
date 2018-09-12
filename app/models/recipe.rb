class Recipe < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 140 }

end
