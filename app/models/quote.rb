class Quote < ApplicationRecord
  belongs_to :vendor
  belongs_to :user
  has_many :favorite_vendors, through: :vendor
end
