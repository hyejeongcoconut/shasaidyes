class AddVendorToInbox < ActiveRecord::Migration[6.0]
  def change
    add_reference :inboxes, :vendor, null: false, foreign_key: true
  end
end
