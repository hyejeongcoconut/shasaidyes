class Vendor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  CATEGORY = ["Reception Venue", "Photographer", "Music & Entertainment","Bridal Salon", "Wedding Dresses", "Wedding Cakes", "Honeymoon Package", "Catering"]
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :quotes, dependent: :destroy
  has_many :users, through: :favorite_vendor
  has_many :products
  has_many :favorite_vendors

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_category_and_price_and_city,
    against: [ :category, :city ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
