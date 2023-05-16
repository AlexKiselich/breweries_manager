class BeersController < ApplicationController
  def index
    @beers = Beer.only_true
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    beer = Beer.find(params[:id])
    beer.update(beer_params)
    redirect_to "/beers/#{beer.id}"
  end

  def destroy
    beer = Beer.find(params[:id])
    beer.destroy
    redirect_to "/beers"
  end

private
  def beer_params
    params.permit(:name, :abv, :on_draft, :beer_type, :untapped_rating)
  end
end