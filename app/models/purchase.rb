class Purchase < ApplicationRecord
  belongs_to :buyer, class_name: "User", foreign_key: "user_id"
  belongs_to :artwork
  after_create :update_artwork_status

  def update_artwork_status
    artwork.update(on_sale: false)
  end
end
