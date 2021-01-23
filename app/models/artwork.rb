class Artwork < ApplicationRecord
  TECHNIQUES = %w(sculpture painting digital)
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :technique, inclusion: TECHNIQUES
end
