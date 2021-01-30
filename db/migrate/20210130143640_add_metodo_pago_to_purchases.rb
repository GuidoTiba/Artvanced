class AddMetodoPagoToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :metodopago, :string
  end
end
