class AddDefaultValueToGuests < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:guests, :rsvp, 0)
  end
end
