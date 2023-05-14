class BreweriesController < ApplicationController
  def index
    @breweries = Brewery.sort_by_most_recent
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def new
  end

  def create
    brewery = Brewery.new({
      name: params[:name],
      draft_lines: params[:draft_lines],
      serves_food: params[:serves_food]
    })
    brewery.save
    redirect_to "/breweries"
  end



end