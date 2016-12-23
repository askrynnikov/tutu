Rails.application.routes.draw do
  resources :cars
  resources :compartment_cars, controller: 'cars', type: 'CompartmentCar'
  resources :seat_cars, controller: 'cars', type: 'SeatCar'
  resources :economy_cars, controller: 'cars', type: 'EconomyCar'
  resources :sleeping_cars, controller: 'cars', type: 'SleepingCar'
  resources :routes
  resources :trains do
    resources :cars, shallow: true
    resources :compartment_cars, controller: 'cars', type: 'CompartmentCar', shallow: true
    resources :seat_cars, controller: 'cars', type: 'SeatCar', shallow: true
    resources :economy_cars, controller: 'cars', type: 'EconomyCar', shallow: true
    resources :sleeping_cars, controller: 'cars', type: 'SleepingCar', shallow: true
  end
  resources :railway_stations do
    patch :update_station_order_arrival_departure, on: :member
  end

  resource :search, only: [:create, :show]
  resources :tickets
  # resources :tickets, only: [:show, :create, :new]

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
