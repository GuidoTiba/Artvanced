class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
