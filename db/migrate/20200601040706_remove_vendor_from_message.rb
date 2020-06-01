class RemoveVendorFromMessage < ActiveRecord::Migration[6.0]
  def change
    remove_reference :messages, :vendor, null: false, foreign_key: true
  end
end
