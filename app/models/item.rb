class Item < ApplicationRecord
  has_many_attached :images
  has_many :bids
end
