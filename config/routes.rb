Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/breweries", to: "breweries#index"
  get "/breweries/new", to: "breweries#new"
  post "/breweries", to: "breweries#create"

  get "/breweries/:id/edit", to: "breweries#edit"
  patch "/breweries/:id", to: "breweries#update"
  get "/breweries/:id", to: "breweries#show"
  
  get "/breweries/:id/beers", to: "breweries/beers#index"
  get "/breweries/:id/beers/new", to: "breweries/beers#new"
  post "/breweries/:id/beers", to: "breweries/beers#create"
  
  get "/beers", to: "beers#index"
  get "/beers/:id", to: "beers#show"

end
