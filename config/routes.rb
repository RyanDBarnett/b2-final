Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surgeries, only: [:index, :show]
  resources :operations, only: [:create]
  resources :hospitals, only: [] do
    resources :surgeries, only: [:index], controller: 'hospital_surgeries'
  end
end
