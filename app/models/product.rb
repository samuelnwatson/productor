class Product < ApplicationRecord
  has_many :catalogues
  has_many :categories, through: :catalogues

  accepts_nested_attributes_for :categories
end
