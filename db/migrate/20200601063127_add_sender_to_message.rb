class AddSenderToMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :sender, polymorphic: true, null: false
  end
end
