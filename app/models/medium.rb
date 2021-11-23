class Medium < ApplicationRecord
  belongs_to :dashboard
  belongs_to :mediable, polymorphic: true
end
