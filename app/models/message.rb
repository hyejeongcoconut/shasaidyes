class Message < ApplicationRecord
  belongs_to :inbox
  belongs_to :sender, polymorphic: true
end
