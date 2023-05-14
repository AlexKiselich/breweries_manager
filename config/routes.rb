Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/breweries", to: "breweries#index"
  get "/breweries/new", to: "breweries#new"
  post "/breweries", to: "breweries#create"

  get "/breweries/:id", to: "breweries#show"
  get "/beers", to: "beers#index"
  get "/beers/:id", to: "beers#show"
  get "/breweries/:brewery_id/beers", to: "breweries/beers#index"

end
