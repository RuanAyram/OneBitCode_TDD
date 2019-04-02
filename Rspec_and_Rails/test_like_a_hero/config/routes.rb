Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :weapons, only: [:index, :create, :show]
  delete '/weapons/:id' => 'weapons#delete'
  resources :enemies, only: [:index, :show, :create, :update, :destroy]
end
