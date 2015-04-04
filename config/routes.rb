Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons
  patch 'capture/:id', to: 'pokemons#capture', as: :capture
  patch 'smack/:id', to: 'pokemons#smack', as: :smack
end
