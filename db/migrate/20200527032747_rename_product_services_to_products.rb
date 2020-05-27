class RenameProductServicesToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_table :product_services, :products
  end
end
