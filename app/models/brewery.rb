class Brewery < ApplicationRecord
  has_many :beers

  def self.sort_by_most_recent
    order(created_at: :desc)
  end

  def count
    beers.size
  end

  def sort_alphabetically
    beers.order(:name)
  end

  def sort_by(params)
    if params[:sort] == 'abc'
      sort_alphabetically
    else
      beers.order(created_at: :desc)
    end
  end
  
end