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
    Brewery.create(brewery_params)
    redirect_to "/breweries"
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    brewery = Brewery.find(params[:id])
    brewery.update(brewery_params)
    redirect_to "/breweries/#{brewery.id}"
  end

private

  def brewery_params
    params.permit(:name, :serves_food, :draft_lines)
  end




end