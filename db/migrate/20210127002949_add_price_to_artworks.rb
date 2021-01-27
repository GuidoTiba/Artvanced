class AddPriceToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :price, :integer
  end
end
