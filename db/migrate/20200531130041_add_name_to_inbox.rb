class AddNameToInbox < ActiveRecord::Migration[6.0]
  def change
    add_column :inboxes, :name, :string
  end
end
