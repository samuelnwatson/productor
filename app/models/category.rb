class Category < ApplicationRecord
  has_many :catalogues
  has_many :products, through: :catalogues
end
