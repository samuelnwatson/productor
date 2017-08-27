class Product < ApplicationRecord
  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
  has_many :catalogues
  has_many :categories, through: :catalogues

  accepts_nested_attributes_for :categories
end
