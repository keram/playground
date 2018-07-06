Rails.application.routes.draw do
  resources :escapes, only: [:index, :new, :create, :edit, :update]
  root to: 'escapes#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
