class ProductType < ApplicationRecord
  has_many :products
  validates :product_type, presence: true
  validates :unit, presence: true
end
