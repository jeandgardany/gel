Rails.application.routes.draw do
  get 'control_members/index' => 'control_members#index'
  get 'control_member/id/show' => 'control_member#id#show'
  resources :quantities
  resources :reserves
  get '/reserve/solicitations' => 'reserves#solicitations'
  resources :solicitations
  resources :offices
  resources :employees
  resources :patrimonies
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
  get '/stock/index_pdf' => 'stocks#index_pdf'
  post '/stock/id/show_pdf' => 'stocks#id#show_pdf'
  get '/stock/buscar' => 'stocks#buscar'
  post '/stock/resultado' => 'stocks#resultado'
  get '/stock/input' => 'stocks#input'
  get '/stock/exit' => 'stocks#exit'
  get '/stock/laboratory1' => 'stocks#laboratory1'
  get '/stock/laboratory2' => 'stocks#laboratory2'
  get '/stock/laboratory3' => 'stocks#laboratory3'
  resources :laboratories
  get '/laboratory/laboratorios' => 'laboratories#laboratorios'
  resources :products
  get '/product/buscar' => 'products#buscar'
  post '/product/resultado' => 'products#resultado'
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
