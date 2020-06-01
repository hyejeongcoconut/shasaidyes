class Product < ApplicationRecord
  belongs_to :vendor
  has_many_attached :photos
  validates :name, :price, :description, :category, presence:true
end
