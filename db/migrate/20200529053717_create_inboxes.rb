class CreateInboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :inboxes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
