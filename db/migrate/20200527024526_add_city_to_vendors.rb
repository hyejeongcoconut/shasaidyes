class AddCityToVendors < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :city, :string
  end
end
