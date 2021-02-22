Rails.application.routes.draw do
  resources :mechanics

  post "/mechanics/mechanic_rides", to: "mechanic_rides#create", as: :mechanic_rides_create
end
