class ChangePhoneNumberToBeStringInVendors < ActiveRecord::Migration[6.0]
  def change
    change_column :vendors, :phone_number, :string
  end
end
