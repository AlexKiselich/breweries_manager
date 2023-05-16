class Breweries::BeersController < ApplicationController
  def index 
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end

  def new
    @brewery = Brewery.find(params[:id])
  end

  def create
    @brewery = Brewery.find(params[:id])
    @brewery.beers.create!(beer_params)
    redirect_to "/breweries/#{@brewery.id}/beers"
  end

private
  def beer_params
    params.permit(:name, :abv, :beer_type, :abv, :on_draft, :untapped_rating)
  end
end