class Category < ApplicationRecord
  validates :title, presence: true
  has_many :catalogues
  has_many :products, through: :catalogues

  accepts_nested_attributes_for :products
end
