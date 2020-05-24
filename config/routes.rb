Rails.application.routes.draw do
  resources :trades
  #get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root :to => "home#index"
  root :to => "trades#index"
  
end
