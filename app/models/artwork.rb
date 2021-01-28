class Artwork < ApplicationRecord
  TECHNIQUES = %w(sculpture painting digital)
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :purchases

  # Con esto se puede hacer obra.author y
  # devuelve el usuario que creó esa obra.

  validates :title, presence: true
  validates :technique, inclusion: TECHNIQUES
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def owner
    if purchases.empty?
      author
    else
      purchases.last.buyer
    end
  end
end
