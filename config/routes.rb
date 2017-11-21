Rails.application.routes.draw do
  resources :movements
    resources :stocks
  get '/movement/inputs' => 'movements#inputs'
  get '/movement/exits' => 'movements#exits'
  get '/movement/currentInventory' => 'movements#currentInventory'
  devise_for :users
  get 'home/index'
  root 'home#index'
  get 'reports/index'
  get '/input/buscar' => 'inputs#buscar'
  post '/input/resultado' => 'inputs#resultado'
  resources :stocks
  get '/stock/buscar' => 'stocks#buscar'
  post '/stock/resultado' => 'stocks#resultado'
  get '/stock/entrada' => 'stocks#entrada'
  resources :laboratories
  resources :products
  get '/product/buscar' => 'products#buscar'
  post '/product/resultado' => 'products#resultado'
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
