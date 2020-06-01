class Inbox < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
end
