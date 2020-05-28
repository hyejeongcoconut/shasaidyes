class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :guests, dependent: :destroy

  has_many :favorite_vendors

  has_many :vendors, through: :favorite_vendor

  has_one_attached :photo
end
