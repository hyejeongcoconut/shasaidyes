class Inbox < ApplicationRecord
  has_many :messages
  belongs_to :favorite_vendor
end
