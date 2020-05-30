class Vendor < ApplicationRecord
  include Rails.application.routes.url_helpers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  category = ["Reception Venue", "Photographers", "Bridal Salons", "Wedding Planner", "Wedding Cakes", "Honeymoon", "Caterers"]
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :quotes, dependent: :destroy
  has_many :users, through: :favorite_vendor
  has_many :products
  has_many :favorite_vendors

  has_one_attached :photo

  def photo_url
    rails_blob_path(self.photo, disposition: "attachment", only_path: true)
  end

  def hello
    puts 'Hello'
  end

  include PgSearch::Model
  pg_search_scope :search_by_category_and_price_and_city,
    against: [ :category,
               :city ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
