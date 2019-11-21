Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:index, :show, :new, :create]
  end
  # resources :ingredients, only: [:index, :show] do
  #   resources :doses, only: [:index, :show, :new, :create]
  # end
  resources :doses, only: [:new, :show, :create, :destroy]
  # root_to 'cocktails#index
end
