class AddAveragePriceToVendors < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :average_price, :integer
  end
end
