class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :guests, dependent: :destroy

  has_many :favorite_vendors

  has_many :quotes

  has_many :vendors, through: :favorite_vendors

  has_many :messages, as: :sender

  has_one_attached :photo

  validates :first_name, :last_name, presence:true

  def name
    name = first_name + last_name
  end
end
