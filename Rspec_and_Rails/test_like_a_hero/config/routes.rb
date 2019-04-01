Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :enemies, only: [:update, :destroy]
  resources :weapons, only: [:index, :create, :show]
  delete '/weapons/:id' => 'weapons#delete'
end
