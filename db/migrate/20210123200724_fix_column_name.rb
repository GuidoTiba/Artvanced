class FixColumnName < ActiveRecord::Migration[6.0]
    def change
      change_table :artworks do |t|
        t.rename :onsale, :on_sale
      end
    end
end
