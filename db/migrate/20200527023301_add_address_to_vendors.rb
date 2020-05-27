class AddAddressToVendors < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :address, :string
  end
end
