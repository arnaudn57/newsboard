class Medium < ApplicationRecord
  belongs_to :dashboard
  belongs_to :mediable, polymorphic: true

    CATEGORIES = ['tech', 'Economie', 'Sciences', 'Politique', 'Cinema', 'Voyage', 'Musique', 'Sport']
end
