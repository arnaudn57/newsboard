class Favori < ApplicationRecord
  belongs_to :user
  belongs_to :medium

  def articles
    Favori.all.select { |favori| favori.medium.mediable_type == 'Article' }
  end

end
