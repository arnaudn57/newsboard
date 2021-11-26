class Podcast < ApplicationRecord
  has_many :medium, as: :mediable
end
