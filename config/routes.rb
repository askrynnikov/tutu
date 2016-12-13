Rails.application.routes.draw do
  resources :cars
  resources :compartment_cars, controller: 'cars', type: 'CompartmentCar'
  resources :seat_cars, controller: 'cars', type: 'SeatCar'
  resources :routes
  resources :trains
  resources :railway_stations
  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
