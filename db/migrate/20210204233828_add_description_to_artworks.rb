class AddDescriptionToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :description, :text
  end
end
