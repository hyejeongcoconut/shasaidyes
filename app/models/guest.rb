class Guest < ApplicationRecord
  belongs_to :user
  FOOD_PREFERENCE = ["Meat", "Fish", "Vegetarian"]

  validates :first_name, :last_name, :phone_number, :email, :additional_guest_numbers, :food_preference, presence:true
end
