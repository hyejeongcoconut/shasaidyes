class RemoveUserFromInbox < ActiveRecord::Migration[6.0]
  def change
    remove_reference :inboxes, :user, null: false, foreign_key: true
  end
end
