class Video < ApplicationRecord
  has_many :medium, as: :mediable
end
