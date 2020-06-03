class AddReferenceFromFavoriteVendorsToInbox < ActiveRecord::Migration[6.0]
  def change
    add_reference :inboxes, :favorite_vendor, foreign_key: true
  end
end
