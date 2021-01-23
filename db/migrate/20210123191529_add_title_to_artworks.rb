class AddTitleToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :title, :string
  end
end
