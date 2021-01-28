class Artwork < ApplicationRecord
  TECHNIQUES = %w(sculpture painting digital)
  belongs_to :user
  has_many_attached :photos

  validates :title, presence: true
  validates :technique, inclusion: TECHNIQUES
end
