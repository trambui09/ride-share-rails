Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'homepages#index'


  resources :drivers
  # don't we need trips :index and :new for the nested routes?
  resources :passengers do
    resources :trips, only: [:index, :new]
  end

  resources :trips, except: [:index, :new]
end
