class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :email
      t.boolean :rsvp
      t.integer :additional_guest_numbers
      t.string :food_preference
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
