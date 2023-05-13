class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.sort_by_most_recent
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

end