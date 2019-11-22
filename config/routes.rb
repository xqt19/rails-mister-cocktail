Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, except: [:index] do
    resources :doses, only: [:index, :show, :new, :create]
  end
  # delete '/cocktails/:id', to: 'cocktails#destroy', as: :delete
  resources :doses, only: [:new, :show, :create, :destroy]

end
