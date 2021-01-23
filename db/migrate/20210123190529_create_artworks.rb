class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :technique
      t.boolean :onsale, default: false

      t.timestamps
    end
  end
end
