Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surgeries, only: [:index, :show]
  resources :operations, only: [:create]
  # get '/surgeries', to: 'surgery#index'
  # get '/surgeries/:id', to: 'surgery#show'
end
