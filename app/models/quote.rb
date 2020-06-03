class Quote < ApplicationRecord
  belongs_to :vendor
  belongs_to :user
  belongs_to :favorite_vendor
  #has_one :favorite_vendor, through: :vendor
end
