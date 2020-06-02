class RemoveVendorFromInbox < ActiveRecord::Migration[6.0]
  def change
    remove_reference :inboxes, :vendor, null: false, foreign_key: true
  end
end
