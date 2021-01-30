class AddDomicilioToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :domicilio, :string
  end
end
