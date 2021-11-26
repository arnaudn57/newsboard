class Article < ApplicationRecord
  has_many :medium, as: :mediable
end
