class Dashboard < ApplicationRecord
  belongs_to :user
  has_many :medium

  def elements
    medium.map(&:mediable)
  end

  def articles
    elements.select { |element| element.is_a?(Article)}
  end

  def podcasts
    elements.select { |element| element.is_a?(Podcast)}
  end

  def videos
    elements.select { |element| element.is_a?(Video)}
  end

end
