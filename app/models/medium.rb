class Medium < ApplicationRecord
  belongs_to :dashboard
  belongs_to :mediable, polymorphic: true
  has_many :articles, :through => :medium, :source_type => "Article"
  # has_many :articles, :through => :medium, :source_type => "Podcast"
  # has_many :articles, :through => :medium, :source_type => "Video"


    CATEGORIES = ['tech', 'Economie', 'Sciences', 'Politique', 'Cinema', 'Voyage', 'Musique', 'Sport']
end
