class Storage < ApplicationRecord
  belongs_to :user
  has_many :products
  validates :storage_name, presence: true

  scope :fridge, -> { where(storage_name: 'Fridge') }
  scope :refrigerator, -> { where(storage_name: 'Refrigerator') }
  scope :pantry, -> { where(storage_name: 'Pantry') }
end
