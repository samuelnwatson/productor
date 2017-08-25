class Product < ApplicationRecord
  has_many :catalogues
  has_many :categories, through: :catalogues
end
