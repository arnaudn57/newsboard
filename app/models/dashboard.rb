class Dashboard < ApplicationRecord
  belongs_to :user
  has_many :media, as: :mediable
end
