class RemovePriceFromPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :price, :integer
  end
end
