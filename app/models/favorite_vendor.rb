class FavoriteVendor < ApplicationRecord
  belongs_to :vendor
  belongs_to :user
  has_many :quotes, through: :vendor
end
