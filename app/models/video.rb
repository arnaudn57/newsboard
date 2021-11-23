class Video < ApplicationRecord
  has_many :media, as: :mediable
end
