class Brewery < ApplicationRecord
  has_many :beers

  def self.sort_by_most_recent
    order(created_at: :desc)
  end

end