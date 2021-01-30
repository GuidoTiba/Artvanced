class AddDomicilioToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :domicilio, :string
    add_column :purchases, :, :string
  end
end
