class Article < ApplicationRecord
  has_many :media, as: :mediable
end
