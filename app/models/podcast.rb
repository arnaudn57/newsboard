class Podcast < ApplicationRecord
  has_many :media, as: :mediable
end
