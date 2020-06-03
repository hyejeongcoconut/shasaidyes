class FavoriteVendor < ApplicationRecord
  belongs_to :vendor
  belongs_to :user
  has_one :quote, dependent: :destroy
  has_one :inbox, dependent: :destroy
  #has_one :quote, through: :vendor
end
